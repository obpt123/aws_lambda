const aws = require("aws-sdk");
const s3 = new aws.S3();
const bucket = "ypbbucket";
const getBucketText = (key) => {
    return new Promise((resolve, reject) => {
        s3.getObject({
            Bucket: bucket,
            Key: key
        }, (err, data) => {
            if (err) reject(err)
            else resolve(data.Body.toString('utf-8'));
        });
    })
}
const hasBucketKey = (key) => {
    return new Promise((resolve, reject) => {
        s3.headObject({
            Bucket: bucket,
            Key: key
        }, (err, data) => {
            if (err) {
                err.code === "NotFound" ? resolve(false) : reject(err);
            }
            else resolve(true);
        });
    })
}
const putBucketText = (key, content) => {
    return new Promise((resolve, reject) => {
        s3.putObject({
            Bucket: bucket,
            Key: key,
            Body: content
        }, (err, data) => {
            if (err) reject(err)
            else resolve();
        });
    });
}
const calcfact = (bigNum) => {
    const one = BigInt(1);
    let result = one;
    let current = one;
    while (current <= bigNum) {
        result = result * current;
        current = current + one;
    }
    return result;
}

exports.handler = async (event) => {
    const num = BigInt(event.num || 1);
    const key = `${num}.fact`
    if (await hasBucketKey(key)) {
        return await getBucketText(key);
    } else {
        const res = calcfact(num).toString();
        await putBucketText(key, res);
        return res;
    }
};
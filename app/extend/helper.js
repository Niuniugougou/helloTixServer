const jwt = require("jsonwebtoken");
const crypto = require('crypto');
module.exports = {
    loginToken(data, expires = 7200) {
        const exp = Math.floor(Date.now() / 1000) + expires
        const cert = 'hagoubang'
        const token = jwt.sign({ data }, cert, { expiresIn: exp })
        return token
    },
    MD5_SUFFIX: '我家狗狗是女神',
    md5: function (str) {
        var obj = crypto.createHash('md5');
        obj.update(str);
        return obj.digest('hex');
    },
    key: 'communication123'
}
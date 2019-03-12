const moment = require('moment');

//时间格式化
exports.formatTime = time => moment(time).format('YYYY-MM-DD HH:mm:ss');

//uuid格式：年月日时分秒3位毫秒+3位随机数，共20位  ===>   20190312162455043167
exports.uuid = function uuid() {
    let uuid = moment().format("YYYYMMDDHHmmssSSS");
    uuid += (Array(3).join(0) + Math.random()*100).slice(-3);
    return uuid;
};
//补零
exports.prefixInteger = (num, n)=> (Array(n).join(0) + num).slice(-n);


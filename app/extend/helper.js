const moment = require('moment');

exports.formatTime = time => moment(time).format('YYYY-MM-DD HH:mm:ss');


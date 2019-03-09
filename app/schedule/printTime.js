const Subscription = require('egg').Subscription;

class PrintTime extends Subscription {
    // 通过 schedule 属性来设置定时任务的执行间隔等配置
    static get schedule() {
        return {
            // 每三小时准点执行一次
            //cron: '* * */3 * * *',
            interval: '10m', // 10 分钟间隔
            type: 'all', // 指定所有的 worker 都需要执行
            immediate: true,
        };
    }

    // subscribe 是真正定时任务执行时被运行的函数
    async subscribe() {
        const nowTime = this.ctx.helper.formatTime(new Date());
        this.ctx.logger.info("NowTime:: %s",nowTime)
    }
}

module.exports = PrintTime;
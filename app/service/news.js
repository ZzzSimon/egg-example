const Service = require('egg').Service;

class NewsService extends Service {
    async list() {
        const sql = "SELECT url,title FROM news ";
        const list =await this.app.mysql.query(sql, []);
        return list;
    }

    async detail(id = 1){
        const sql = "SELECT title,detail FROM news WHERE id = ?";
        return await this.app.mysql.query(sql,[id])
    }

    async save(news = {}){
        return await this.app.mysql.insert('news',news);
    }
}

module.exports = NewsService;
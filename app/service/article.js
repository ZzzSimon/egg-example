const Service = require('egg').Service;

class ArticleService extends Service {
    async list() {
        const sql = "SELECT url,title,author,update_time FROM article WHERE invisible = ?";
        const list =await this.app.mysql.query(sql, [0]);
        return list;
    }

    async detail(id = 1){
        const sql = "SELECT title,detail,author,update_time FROM article WHERE id = ?";
        return await this.app.mysql.query(sql,[id])
    }

    async save(article = {}){
        return await this.app.mysql.insert('article',article);
    }

    async getArticleByAuthor(author){
        const sql = "SELECT id,url,title,author,update_time FROM article WHERE author = ?";
        const list =await this.app.mysql.query(sql, [author]);
        return list;
    }
}

module.exports = ArticleService;
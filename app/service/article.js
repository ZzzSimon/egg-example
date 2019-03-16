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
        const res = await this.app.mysql.insert('article',article);
        return res.affectedRows === 1;
    }

    async modify(article = {}){
        const res = await this.app.mysql.update('article',article);
        return res.affectedRows === 1;
    }

    async getArticleByAuthor(author){
        const sql = "SELECT id,url,title,author,update_time FROM article WHERE author = ?";
        const list =await this.app.mysql.query(sql, [author]);
        return list;
    }

    async getArticleById(id){
        const sql = "SELECT id,title,detail FROM article WHERE id = ?";
        const list =await this.app.mysql.query(sql, [id]);
        return list[0];
    }
}

module.exports = ArticleService;
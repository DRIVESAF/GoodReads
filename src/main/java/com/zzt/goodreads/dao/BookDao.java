package com.zzt.goodreads.dao;

import com.zzt.goodreads.entity.Book;
import com.zzt.goodreads.utils.DataSourceUtil;
import org.apache.commons.dbutils.*;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

/**
 * @author: DRIVESAF
 * @createTime: 2023/12/05 14:55
 * @description:
 **/
public class BookDao {
    private final QueryRunner queryRunner = new QueryRunner(DataSourceUtil.getDataSource());

    //开启驼峰映射
    private final BeanProcessor beanProcessor = new GenerousBeanProcessor();

    private final RowProcessor processor = new BasicRowProcessor(beanProcessor);


    /**
     * 根 据id 找分类
     *
     * @param id 分类id
     * @return 分类
     */
    public Book findById(int id) {
        String sql = "SELECT * FROM category WHERE id=? ";
        Book book = null;
        try {
            book = queryRunner.query(sql, new BeanHandler<>(Book.class, processor), id);
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return book;
    }


    /**
     * 返回分类列表
     *
     * @return 分类列表
     */
    public List<Book> list() {
        String sql = "SELECT * FROM category ORDER BY weight DESC ";
        List<Book> list = null;
        try {
            list = queryRunner.query(sql, new BeanListHandler<>(Book.class, processor));
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return list;
    }
}

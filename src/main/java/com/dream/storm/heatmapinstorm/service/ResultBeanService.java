package com.dream.storm.heatmapinstorm.service;

import com.dream.storm.heatmapinstorm.domain.ResultBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * @Description: Result服务
 * @Author: shouzhuangjiang
 * @Create: 2018-07-22 23:19
 */
@Service
public class ResultBeanService {

    @Autowired
    JdbcTemplate jdbcTemplate;

    public List<ResultBean> query() {

        String sql = "select longitude, latitude, count(1) as count from heatmap GROUP BY longitude, latitude";

        return (List<ResultBean>) jdbcTemplate.query(sql, new RowMapper<ResultBean>() {

            @Override
            public ResultBean mapRow(ResultSet resultSet, int i) throws SQLException {

                ResultBean bean = new ResultBean();
                bean.setLng(resultSet.getDouble("longitude"));
                bean.setLat(resultSet.getDouble("latitude"));
                bean.setCount(resultSet.getLong("count"));

                return bean;
            }
        });
    }
}

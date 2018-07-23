package com.dream.storm.heatmapinstorm.controller;

import com.dream.storm.heatmapinstorm.domain.ResultBean;
import com.dream.storm.heatmapinstorm.service.ResultBeanService;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @Description: TODO
 * @Author: shouzhuangjiang
 * @Create: 2018-07-22 23:26
 */
@RestController
public class HeatMapApp {

    @Autowired
    ResultBeanService resultBeanService;

    @GetMapping("/maptest")
    public ModelAndView map() {
        return new ModelAndView("map");
    }

    @GetMapping("/map")
    public ModelAndView heatmap() {

        ModelAndView view = new ModelAndView("map");
        List<ResultBean> resultBeanList = resultBeanService.query();

        JSONArray jsonArray = JSONArray.fromObject(resultBeanList);

        System.out.println(jsonArray);

        view.addObject("dataJson", jsonArray);

        return view;
    }
}

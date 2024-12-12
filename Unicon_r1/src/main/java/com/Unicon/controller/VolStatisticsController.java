package com.Unicon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.inject.Inject;
import java.util.Map;
import java.util.List;
import java.util.HashMap;

import com.Unicon.service.VolStatisticsServiceImpl;

@Controller
@RequestMapping("/volunteer/manage")
public class VolStatisticsController {

    @Inject
    private VolStatisticsServiceImpl statisticsService;

    @GetMapping("/volStatistics")
    public String statisticsPage() {
        return "volunteer/manage/volStatistics";
    }

    @GetMapping("/data")
    @ResponseBody
    public Map<String, Object> getStatisticsData() {
        return statisticsService.getAllStatistics();
    }
}
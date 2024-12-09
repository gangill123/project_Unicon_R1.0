package com.Unicon.controller;

import com.Unicon.persistence.MapDAO;
import com.Unicon.domain.MapVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class MapController {

    @GetMapping("/map")
    public String showMap(Model model) {
        MapDAO mapDAO = new MapDAO();
        List<MapVO> addresses = mapDAO.getAllAddresses();
        model.addAttribute("addresses", addresses);
        return "map/map";  // /WEB-INF/views/map/map.jsp를 가리킵니다
    }
}
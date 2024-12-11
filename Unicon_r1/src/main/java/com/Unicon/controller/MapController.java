package com.Unicon.controller;

import com.Unicon.persistence.MapDAO;
import com.Unicon.domain.MapVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
public class MapController {

    private static final Logger logger = LoggerFactory.getLogger(MapController.class);
    private final MapDAO mapDAO;

    @Autowired
    public MapController(MapDAO mapDAO) {
        this.mapDAO = mapDAO;
    }

    @GetMapping("/map")
    public String showMap(Model model, @RequestParam(defaultValue = "1") int page) {
        int recordsPerPage = 10;
        List<MapVO> allAddresses = mapDAO.getAllAddresses();
        int totalRecords = allAddresses.size();
        int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);

        int start = (page - 1) * recordsPerPage;
        int end = Math.min(start + recordsPerPage, totalRecords);
        List<MapVO> addresses = allAddresses.subList(start, end);

        logger.info("Total records: {}", totalRecords);
        logger.info("Total pages: {}", totalPages);
        logger.info("Current page: {}", page);
        logger.info("Start index: {}", start);
        logger.info("End index: {}", end);
        logger.info("Addresses size: {}", addresses.size());

        model.addAttribute("addresses", addresses);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        return "map/map";
    }
}

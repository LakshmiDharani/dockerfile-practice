package com.example.tracker.controller;

import com.example.tracker.service.TrackerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class TrackerController {

    @Autowired
    private TrackerService trackerService;

    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("topics", trackerService.getTopics());
        model.addAttribute("preparationTime", trackerService.getPreparationTime());
        return "index";
    }

    @PostMapping("/addTopic")
    public String addTopic(@RequestParam String topicName) {
        trackerService.addTopic(topicName);
        return "redirect:/";
    }

    @PostMapping("/setPreparationTime")
    public String setPreparationTime(@RequestParam String time) {
        trackerService.setPreparationTime(time);
        return "redirect:/";
    }

    @PostMapping("/markAsCovered")
    public String markAsCovered(@RequestParam String topicName) {
        trackerService.markAsCovered(topicName);
        return "redirect:/";
    }
}

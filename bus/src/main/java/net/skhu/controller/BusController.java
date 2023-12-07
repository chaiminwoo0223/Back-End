package net.skhu.controller;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import net.skhu.entity.Bus;
import net.skhu.repository.BusRepository;

@Controller
public class BusController {

    @Autowired BusRepository busRepository;

    @RequestMapping("bus/list1")
    public String test1(@RequestParam(name = "busNo") String busNo, Model model) {
    	Bus bus = busRepository.findByBusNo(busNo);
        model.addAttribute("buses", Collections.singletonList(bus));
        return "bus/list";
    }

    @RequestMapping("bus/list2")
    public String test2(@RequestParam(name = "startStop") String startStop, Model model) {
        List<Bus> buses = busRepository.findByFirstStop(startStop);
        model.addAttribute("buses", buses);
        return "bus/list";
    }

    @RequestMapping("bus/list3")
    public String test3(@RequestParam(name = "categoryId") int categoryId, Model model) {
        List<Bus> buses = busRepository.findByCategoryId(categoryId);
        model.addAttribute("buses", buses);
        return "bus/list";
    }

    @RequestMapping("bus/list4")
    public String test4(@RequestParam(name = "categoryName") String categoryName, Model model) {
        List<Bus> buses = busRepository.findByCategoryCategoryName(categoryName);
        model.addAttribute("buses", buses);
        return "bus/list";
    }

    @RequestMapping("bus/list5")
    public String test5(Model model) {
        model.addAttribute("buses",
        		busRepository.findByOrderByFirstBus());
        return "bus/list";
    }
}
package net.skhu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import net.skhu.entity.Book;
import net.skhu.repository.BookRepository;

@Controller
public class BookController {

	@Autowired BookRepository bookRepository;

	@RequestMapping("book/test1")
	public String test1(Model model) {
		Book book = bookRepository.findByAuthor("멜빌");
		model.addAttribute("books", book);
		return "book/list";
	}

	@RequestMapping("book/test2")
	public String test2(Model model) {
		model.addAttribute("books",
				bookRepository.findByTitle("모비딕"));
		return "book/list";
	}

	@RequestMapping("book/test3")
    public String test3(Model model) {
        model.addAttribute("books",
        		bookRepository.findByTitleStartsWith("모"));
        return "book/list";
    }

    @RequestMapping("book/test4")
    public String test4(Model model) {
        model.addAttribute("books",
                bookRepository.findByCategoryName("소설"));
        return "book/list";
    }

    @RequestMapping("book/test5")
    public String test5(Model model) {
        model.addAttribute("books",
        		bookRepository.findByCategoryNameStartsWith("소"));
        return "book/list";
    }

    @RequestMapping("book/test6")
    public String test6(Model model) {
        model.addAttribute("books",
        		bookRepository.findByOrderByTitle());
        return "book/list";
    }

    @RequestMapping("book/test7")
    public String test7(Model model) {
        model.addAttribute("books",
        		bookRepository.findByOrderByTitleDesc());
        return "book/list";
    }

    @RequestMapping("book/test8")
    public String test8(Model model) {
        model.addAttribute("books",
        		bookRepository.findByCategoryIdOrderByTitleDesc(2));
        return "book/list";
    }
}
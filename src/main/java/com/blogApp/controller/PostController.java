package com.blogApp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.blogApp.entity.Post;
import com.blogApp.requestDTO.PostRequestDTO;
import com.blogApp.responseDTO.PostResponse;
import com.blogApp.responseDTO.PostResponseDTO;
import com.blogApp.service.PostService;
import com.blogApp.utils.AppConstants;

@Controller
public class PostController {
	
	@Autowired
	private PostService postService;

	@RequestMapping(value = "/createPostForm", method = RequestMethod.GET)
	public String returnCreatePostForm() {
		return "createPostForm";
	}
	
	@PostMapping("/createPost")
	public String saveNewPost(@ModelAttribute PostRequestDTO postRequestDTO) {
		System.out.println("ABC");
		PostResponseDTO newPost = postService.savePost(postRequestDTO);
		return "redirect:getAllPost";
	}
	@GetMapping("/deletePost/{postId}")
	public String deletePost(@PathVariable Long postId) {
		Post post = postService.deletePost(postId);
		return "redirect:/getAllPost";
	}
	
	@RequestMapping(value = "/getAllPost",method = RequestMethod.GET)
	public String getALLPost(Model model,
			@RequestParam(value="pageNo", defaultValue = AppConstants.DEFAULT_PAGE_NO, required = false) int pageNo,
			@RequestParam(value="pageSize", defaultValue = AppConstants.DEFAULT_PAGE_SIZE, required = false) int pageSize,
			@RequestParam(value="sortBy", defaultValue = AppConstants.DEFAULT_PAGE_SORT_BY, required = false) String sortBy,
			@RequestParam(value="ascDir", defaultValue = AppConstants.DEFAULT_PAGE_SORT_DIR, required = false) String ascDir
			){
		Page<Post> allPost = postService.getAllPost(pageNo, pageSize, sortBy, ascDir);
		model.addAttribute("allPost",allPost);
		model.addAttribute("ascDir", ascDir);
		 return "postList";
	}
	
	@GetMapping("/getPost/{postId}")
	public String getPostById(Model model,@PathVariable Long postId) {
		PostResponseDTO post = postService.findPostById(postId);
		model.addAttribute("post",post);
		return "createPostForm";
	}
	
	@PostMapping("/loadPostList")
	public String getPosts(@ModelAttribute PostRequestDTO postRequestDTO) {
		List<Post> post = postService.getPostBySearchCriteria(postRequestDTO);
		return "postList";
	}
	

}

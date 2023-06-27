package com.blogApp.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import com.blogApp.entity.Post;
import com.blogApp.requestDTO.PostRequestDTO;
import com.blogApp.responseDTO.PostResponseDTO;

@Service
public interface PostService {

	public PostResponseDTO savePost(PostRequestDTO postRequestDTO);
	
	public Page<Post> getAllPost(int pageNo, int pageSize, String sortBy, String ascDir);
	
	public PostResponseDTO findPostById(Long postId);
	
	public PostResponseDTO updatePost(Long postId, PostRequestDTO post);

	public Post deletePost(Long postId);
	
}

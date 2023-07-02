package com.blogApp.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.blogApp.entity.Post;
import com.blogApp.requestDTO.PostRequestDTO;

@Repository
public interface PostDAO {

	public List<Post> getPostBySearchCriteria(PostRequestDTO postRequestDTO);
	
}

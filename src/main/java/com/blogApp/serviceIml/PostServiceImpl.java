package com.blogApp.serviceIml;

import java.util.List;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.blogApp.entity.Post;
import com.blogApp.exception.ResourceNotFoundException;
import com.blogApp.repository.PostDAO;
import com.blogApp.repository.PostDAOImpl;
import com.blogApp.repository.PostRepository;
import com.blogApp.requestDTO.PostRequestDTO;
import com.blogApp.responseDTO.PostResponse;
import com.blogApp.responseDTO.PostResponseDTO;
import com.blogApp.service.PostService;


@Service
public class PostServiceImpl implements PostService {
	
	@Autowired
	PostDAOImpl postDAOImpl;

	@Autowired
	private PostRepository postRepository;
	
	@Autowired
	private ModelMapper mapper;
	
	@Autowired
	private PostDAO postDAO;

	@Override
	public PostResponseDTO savePost(PostRequestDTO postRequestDTO) {
		Post newPost = mapPostRequestDTOToPostEntity(postRequestDTO);

		Post post = postRepository.save(newPost);
		
		return mapPostToPostResponseDTO(post);

	}

	@Override
	public Page<Post> getAllPost(int pageNo, int pageSize, String sortBy, String ascDir) {
		
		Sort sort = ascDir.equalsIgnoreCase(Sort.Direction.ASC.name())?Sort.by(sortBy).ascending():
			Sort.by(sortBy).descending();
		
		Pageable page = PageRequest.of(pageNo, pageSize, sort);
		Page<Post> allPost = postRepository.findAll(page);
		return allPost;
	}

	@Override
	public PostResponseDTO findPostById(Long postId) {
		Post post = postRepository.findById(postId)
				.orElseThrow(() -> new ResourceNotFoundException("Post", "Id", postId));
		return mapPostToPostResponseDTO(post);
	}

	@Override
	public PostResponseDTO updatePost(Long postId, PostRequestDTO post) {
		
		Post dbPost = postRepository.findById(postId)
				.orElseThrow(() -> new ResourceNotFoundException("Post", "Id", postId));
		
		dbPost.setTitle(post.getTitle());
		dbPost.setDescription(post.getDescription());
		dbPost.setContent(post.getContent());
		Post updatedPost = postRepository.save(dbPost);
		return mapPostToPostResponseDTO(updatedPost);
	}

	@Override
	public Post deletePost(Long postId) {
		Post dbPost = postRepository.findById(postId)
				.orElseThrow(() -> new ResourceNotFoundException("Post", "Id", postId));
		postRepository.deleteById(postId);
		return dbPost;
	}
	
	//convert postRequestDTO to Post Entity
	private Post mapPostRequestDTOToPostEntity(PostRequestDTO postRequestDTO) {
		Post post = mapper.map(postRequestDTO, Post.class);
		return post;
	}
	
	//convert Post Entity to postResponseDTO
	private PostResponseDTO mapPostToPostResponseDTO(Post post) {
		
		PostResponseDTO postResponseDTO = mapper.map(post, PostResponseDTO.class);
		return postResponseDTO;
	}

	@Override
	public List<Post> getPostBySearchCriteria(PostRequestDTO postRequestDTO) {
		
		List<Post> postList =  postDAO.getPostBySearchCriteria(postRequestDTO);
		
		
		
		return null;
	}
	
}

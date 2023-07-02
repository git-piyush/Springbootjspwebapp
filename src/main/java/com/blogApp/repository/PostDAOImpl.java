package com.blogApp.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.blogApp.entity.Post;
import com.blogApp.requestDTO.PostRequestDTO;

@Repository
public class PostDAOImpl implements PostDAO {

	@Autowired
	EntityManager entityManager;
	
	@Override
	 public List<Post> getPostBySearchCriteria(PostRequestDTO postRequestDTO){
		CriteriaBuilder cb = this.entityManager.getCriteriaBuilder();
		CriteriaQuery<Post> cq = cb.createQuery(Post.class);
		Root<Post> root = cq.from(Post.class);
		Predicate condition = cb.conjunction();
		
		if(postRequestDTO.getTitle() != null) {
			condition.getExpressions().add(cb.equal(root.get("title"), postRequestDTO.getTitle()));
		}
		cq.orderBy(cb.desc(root.get("id")));
		cq.where(condition);
		TypedQuery<Post> tq= this.entityManager.createQuery(cq);
		
		List<Post> postList = tq.getResultList();
		
		return postList;
		
	}

}

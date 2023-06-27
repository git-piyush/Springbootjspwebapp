package com.blogApp.responseDTO;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class PostResponseDTO {

	private long id;
	
	private String title;
	
	private String description;
	
	private String content;
	
	
	
}

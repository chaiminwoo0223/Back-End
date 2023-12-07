package net.skhu.dto;

import lombok.Data;

@Data
public class Document {
	int id;
	String fileName;
	int size;
	String modifiedDate;
	int folderId;
	String state;

	String folderName;
}

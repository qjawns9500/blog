package com.collab.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class HashtagDto {
    private String tagContent;
    private int regId;
    private int tagtypeId;
}

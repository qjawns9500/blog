package com.collab.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class NoticeDto {
    private String noticeId;
    private String title;
    private String content;
    private String createDate;
    private int viewCnt; // 조회수

}

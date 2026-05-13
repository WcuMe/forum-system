-- 创建数据库
CREATE DATABASE IF NOT EXISTS forum_db DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE forum_db;

-- 用户表
DROP TABLE IF EXISTS `reply`;
DROP TABLE IF EXISTS `post`;
DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
    `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
    `username` VARCHAR(50) NOT NULL UNIQUE COMMENT '用户名',
    `password` VARCHAR(100) NOT NULL COMMENT '密码',
    `email` VARCHAR(100) COMMENT '邮箱',
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- 帖子表
CREATE TABLE `post` (
    `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
    `title` VARCHAR(200) NOT NULL COMMENT '帖子标题',
    `content` TEXT COMMENT '帖子内容',
    `user_id` BIGINT NOT NULL COMMENT '发布者ID',
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '发布时间',
    FOREIGN KEY (`user_id`) REFERENCES `user`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='帖子表';

-- 回复表
CREATE TABLE `reply` (
    `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
    `content` TEXT NOT NULL COMMENT '回复内容',
    `post_id` BIGINT NOT NULL COMMENT '所属帖子ID',
    `user_id` BIGINT NOT NULL COMMENT '回复者ID',
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '回复时间',
    FOREIGN KEY (`post_id`) REFERENCES `post`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`user_id`) REFERENCES `user`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='回复表';

-- 插入测试数据
INSERT INTO `user` (`username`, `password`, `email`) VALUES
('admin', '123456', 'admin@forum.com'),
('user1', '123456', 'user1@forum.com'),
('user2', '123456', 'user2@forum.com');

INSERT INTO `post` (`title`, `content`, `user_id`) VALUES
('欢迎来到简易论坛', '这是论坛的第一条帖子，欢迎大家使用！', 1),
('测试帖子2', '这是一条测试帖子，用于验证系统功能是否正常。', 2),
('技术讨论', '有没有人了解Spring MVC框架？可以一起讨论一下。', 3);

INSERT INTO `reply` (`content`, `post_id`, `user_id`) VALUES
('太好了，终于有了自己的论坛！', 1, 2),
('欢迎欢迎！', 1, 3),
('Spring MVC是很流行的框架，推荐学习！', 3, 1);
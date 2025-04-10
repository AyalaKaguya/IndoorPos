

CREATE TABLE `room` (
    `room_id` int NOT NULL COMMENT '房间ID',
    `room_name` varchar(16) NOT NULL COMMENT '房间名称',
    `layout_image` blob NOT NULL COMMENT '房间布局图(二进制图片数据)',
    `pixels_per_m` int NOT NULL COMMENT '图像比例(每米对应的像素数)',
    PRIMARY KEY (`room_id`),
    UNIQUE KEY `uk_room_name` (`room_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='房间信息表';

CREATE TABLE `base_station` (
    `base_id` varchar(16) NOT NULL COMMENT '基站ID',
    `room_id` int DEFAULT NULL COMMENT '房间ID',
    `x_axis` double DEFAULT NULL COMMENT 'X轴坐标',
    `y_axis` double DEFAULT NULL COMMENT 'Y轴坐标',
    PRIMARY KEY (`base_id`),
    FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='基站信息表';

CREATE TABLE `employee` (
    `emp_id` varchar(16) NOT NULL COMMENT '员工ID',
    `name` varchar(16) NOT NULL COMMENT '姓名',
    `sex` varchar(10) NOT NULL COMMENT '性别',
    `terminal_id` varchar(16) NOT NULL COMMENT '终端ID',
    PRIMARY KEY (`emp_id`),
    UNIQUE KEY `uk_terminal_id` (`terminal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='员工信息表';

CREATE TABLE `env_factor` (
    `room_id` int NOT NULL COMMENT '房间ID',
    `height` double NOT NULL COMMENT '高度补偿值',
    `n` double NOT NULL COMMENT '环境衰减因子',
    `p0` double NOT NULL COMMENT '一米处接收到的RSSI值',
    PRIMARY KEY (`room_id`),
    FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='环境因子表';

CREATE TABLE `login` (
    `user_id` varchar(16) NOT NULL COMMENT '用户ID',
    `username` varchar(16) NOT NULL COMMENT '用户名',
    `password` varchar(16) NOT NULL COMMENT '密码',
    `role` varchar(8) NOT NULL COMMENT '用户角色',
    PRIMARY KEY (`user_id`),
    UNIQUE KEY `uk_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户登录信息表';

CREATE TABLE `location` (
    `emp_id` varchar(16) NOT NULL COMMENT '员工ID',
    `room_id` int NOT NULL COMMENT '房间ID',
    `x_axis` double NOT NULL COMMENT 'X轴坐标',
    `y_axis` double NOT NULL COMMENT 'Y轴坐标',
    `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '定位时间',
    PRIMARY KEY (`emp_id`, `timestamp`),
    FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`),
    FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='定位历史位置表';



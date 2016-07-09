# v0.1.3
USE todolist

DROP TABLE IF EXISTS user;

CREATE TABLE user (
  id MEDIUMINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR (100) NOT NULL,
  name VARCHAR (60) NOT NULL,
  password VARCHAR (60) NOT NULL,
  mobile VARCHAR (30) NOT NULL DEFAULT "",
  location VARCHAR (30) NOT NULL DEFAULT "",
  avatar VARCHAR (150) NOT NULL DEFAULT "",
  wechatid VARCHAR (50) NOT NULL DEFAULT "",
  enabled BOOLEAN NOT NULL DEFAULT TRUE,
  admin BOOLEAN NOT NULL DEFAULT FALSE,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

CREATE TABLE task (
  id MEDIUMINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  # FK USER
  belongs_to INTEGER NOT NULL DEFAULT 0,
  # status:
  # 0: open
  # 9: close
  status INTEGER NOT NULL DEFAULT 0,
  # category
  # 0: Your Daily To-Do List
  # 5: The Weekly/Monthly Project List (short-term 30 days)
  # 9: The Master Goal List (long-term, 90-180 days)
  category INTEGER NOT NULL DEFAULT 0,
  content VARCHAR (200) NOT NULL DEFAULT "",
  zindex INTEGER NOT NULL DEFAULT 0,
  topmost BOOLEAN NOT NULL DEFAULT FALSE,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  topmosted_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  closed_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

INSERT INTO user (email, name, password, admin, mobile, location, wechatid, avatar) VALUES("nonocast@gmail.com", "Hui", "$2a$10$NvR/yNovADZ2OQiipGUS7On7G0mKDknKzh5oWqGznv.qUIKitN/SC", TRUE, "13817122600", "上海", "oLwYvwad8ofhOc9yHK1WDbfH0mms", "http://wx.qlogo.cn/mmopen/KetjXWSVpptEZctGOzooiaFJCY3d6QV4icImfTyQVEiaibdTrMWlzjE0Bial1LKMkDBaPztNhf5EE9YgsFzBDH6LGDA/0");
INSERT INTO user (email, name, password, admin) VALUES("fyx@gmail.com", "fangyx", "$2a$10$NvR/yNovADZ2OQiipGUS7On7G0mKDknKzh5oWqGznv.qUIKitN/SC", FALSE);
INSERT INTO user (email, name, password, admin) VALUES("gexi7n@gmail.com", "Ge", "$2a$10$NvR/yNovADZ2OQiipGUS7On7G0mKDknKzh5oWqGznv.qUIKitN/SC", TRUE);
INSERT INTO user (email, name, password, admin) VALUES("naodaixiaoxiao@qq.com", "李毓洁", "$2a$10$NvR/yNovADZ2OQiipGUS7On7G0mKDknKzh5oWqGznv.qUIKitN/SC", FALSE);

SET @user = (select id from user where email='nonocast@gmail.com');

INSERT INTO task (belongs_to, status, category, content) VALUES(@user, 0, 0, "上周我们面试实习生,清华的、剑桥的全被我们刷下来了");
INSERT INTO task (belongs_to, status, category, content) VALUES(@user, 0, 0, "只留下一个没上过大学的.");
INSERT INTO task (belongs_to, status, category, content) VALUES(@user, 0, 0, "因为她夸我长的好看.");
INSERT INTO task (belongs_to, status, category, content) VALUES(@user, 0, 0, "如今这个社会敢说实话的人已经不多了.");
INSERT INTO task (belongs_to, status, category, content) VALUES(@user, 0, 0, "好吧,上面是我意淫.");
INSERT INTO task (belongs_to, status, category, content) VALUES(@user, 0, 0, "她根本没夸我好看.");
INSERT INTO task (belongs_to, status, category, content) VALUES(@user, 0, 0, "我问了她连个问题.");

SET @user = (select id from user where email='naodaixiaoxiao@qq.com');

INSERT INTO task (belongs_to, status, category, content) VALUES(@user, 0, 0, "naodaixiaoxiao task 1");
INSERT INTO task (belongs_to, status, category, content) VALUES(@user, 0, 0, "naodaixiaoxiao task 2");
INSERT INTO task (belongs_to, status, category, content) VALUES(@user, 0, 0, "naodaixiaoxiao task 3");

USE weatherNewsDB;

CREATE TABLE user (
    user_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    age INT CHECK (age >= 0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SHOW CREATE TABLE weather_observation;
SHOW CREATE TABLE news_article;

-- User 테이블은 사용자 정보를 저장하기 위한 테이블이다. user_id를 PK로 설정하여 각 사용자를 고유하게 식별한다.
-- username과 email은 필수 입력값으로 설정하고, email에는 UNIQUE 제약조건을 적용하여 중복 가입을 방지한다.
-- age에는 CHECK 제약조건을 적용하여 0 이상의 값만 입력할 수 있도록 설계하였다.

DESC user;

INSERT INTO user (username, email, age)
VALUES ('mira', 'mira@example.com', 30);

SELECT * FROM user;

INSERT INTO user (username, email, age)
VALUES ('test', 'mira@example.com', 25);

ALTER TABLE news_article
ADD COLUMN user_id BIGINT NULL;

ALTER TABLE news_article
ADD CONSTRAINT fk_article_user
FOREIGN KEY (user_id)
REFERENCES user(user_id);

UPDATE news_article
SET user_id = 1
WHERE article_id = 1;

SELECT
    a.article_id,
    a.title,
    u.user_id,
    u.username,
    u.email
FROM news_article a
JOIN user u
ON a.user_id = u.user_id;

/*
 Navicat Premium Data Transfer

 Source Server         : ansible07
 Source Server Type    : PostgreSQL
 Source Server Version : 120002
 Source Host           : ansible07.ovt.iot.fh-njrd.top:5432
 Source Catalog        : xxl_job
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 120002
 File Encoding         : 65001

 Date: 24/09/2021 10:54:48
*/


-- ----------------------------
-- Sequence structure for xxl_job_group_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "xxl_job_group_id_seq";
CREATE SEQUENCE "xxl_job_group_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for xxl_job_info_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "xxl_job_info_id_seq";
CREATE SEQUENCE "xxl_job_info_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for xxl_job_log_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "xxl_job_log_id_seq";
CREATE SEQUENCE "xxl_job_log_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for xxl_job_log_report_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "xxl_job_log_report_id_seq";
CREATE SEQUENCE "xxl_job_log_report_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for xxl_job_logglue_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "xxl_job_logglue_id_seq";
CREATE SEQUENCE "xxl_job_logglue_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for xxl_job_registry_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "xxl_job_registry_id_seq";
CREATE SEQUENCE "xxl_job_registry_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for xxl_job_user_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "xxl_job_user_id_seq";
CREATE SEQUENCE "xxl_job_user_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Table structure for xxl_job_group
-- ----------------------------
DROP TABLE IF EXISTS "xxl_job_group";
CREATE TABLE "xxl_job_group" (
  "id" int4 NOT NULL DEFAULT nextval('xxl_job_group_id_seq'::regclass),
  "app_name" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "title" varchar(12) COLLATE "pg_catalog"."default" NOT NULL,
  "address_type" int2 NOT NULL DEFAULT 0,
  "address_list" text COLLATE "pg_catalog"."default",
  "update_time" timestamp(6)
)
;
COMMENT ON COLUMN "xxl_job_group"."app_name" IS '?????????AppName';
COMMENT ON COLUMN "xxl_job_group"."title" IS '???????????????';
COMMENT ON COLUMN "xxl_job_group"."address_type" IS '????????????????????????0=???????????????1=????????????';
COMMENT ON COLUMN "xxl_job_group"."address_list" IS '?????????????????????????????????????????????';

-- ----------------------------
-- Records of xxl_job_group
-- ----------------------------
BEGIN;
INSERT INTO "xxl_job_group" VALUES (1, 'xxl-job-executor-sample', '???????????????', 0, NULL, '2021-09-24 18:55:31.5');
COMMIT;

-- ----------------------------
-- Table structure for xxl_job_info
-- ----------------------------
DROP TABLE IF EXISTS "xxl_job_info";
CREATE TABLE "xxl_job_info" (
  "id" int4 NOT NULL DEFAULT nextval('xxl_job_info_id_seq'::regclass),
  "job_group" int4 NOT NULL DEFAULT 0,
  "job_desc" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "add_time" timestamp(6),
  "update_time" timestamp(6),
  "author" varchar(64) COLLATE "pg_catalog"."default",
  "alarm_email" varchar(255) COLLATE "pg_catalog"."default",
  "schedule_type" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "schedule_conf" varchar(128) COLLATE "pg_catalog"."default",
  "misfire_strategy" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "executor_route_strategy" varchar(50) COLLATE "pg_catalog"."default",
  "executor_handler" varchar(255) COLLATE "pg_catalog"."default",
  "executor_param" varchar(512) COLLATE "pg_catalog"."default",
  "executor_block_strategy" varchar(50) COLLATE "pg_catalog"."default",
  "executor_timeout" int4 NOT NULL DEFAULT 0,
  "executor_fail_retry_count" int4 NOT NULL DEFAULT 0,
  "glue_type" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "glue_source" text COLLATE "pg_catalog"."default",
  "glue_remark" varchar(128) COLLATE "pg_catalog"."default",
  "glue_updatetime" timestamp(6),
  "child_jobid" varchar(255) COLLATE "pg_catalog"."default",
  "trigger_status" int2 NOT NULL DEFAULT 0,
  "trigger_last_time" int8 NOT NULL DEFAULT 0,
  "trigger_next_time" int8 NOT NULL DEFAULT 0
)
;
COMMENT ON COLUMN "xxl_job_info"."job_group" IS '???????????????ID';
COMMENT ON COLUMN "xxl_job_info"."author" IS '??????';
COMMENT ON COLUMN "xxl_job_info"."alarm_email" IS '????????????';
COMMENT ON COLUMN "xxl_job_info"."schedule_type" IS '????????????';
COMMENT ON COLUMN "xxl_job_info"."schedule_conf" IS '?????????????????????????????????????????????';
COMMENT ON COLUMN "xxl_job_info"."misfire_strategy" IS '??????????????????';
COMMENT ON COLUMN "xxl_job_info"."executor_route_strategy" IS '?????????????????????';
COMMENT ON COLUMN "xxl_job_info"."executor_handler" IS '???????????????handler';
COMMENT ON COLUMN "xxl_job_info"."executor_param" IS '?????????????????????';
COMMENT ON COLUMN "xxl_job_info"."executor_block_strategy" IS '??????????????????';
COMMENT ON COLUMN "xxl_job_info"."executor_timeout" IS '????????????????????????????????????';
COMMENT ON COLUMN "xxl_job_info"."executor_fail_retry_count" IS '??????????????????';
COMMENT ON COLUMN "xxl_job_info"."glue_type" IS 'GLUE??????';
COMMENT ON COLUMN "xxl_job_info"."glue_source" IS 'GLUE?????????';
COMMENT ON COLUMN "xxl_job_info"."glue_remark" IS 'GLUE??????';
COMMENT ON COLUMN "xxl_job_info"."glue_updatetime" IS 'GLUE????????????';
COMMENT ON COLUMN "xxl_job_info"."child_jobid" IS '?????????ID?????????????????????';
COMMENT ON COLUMN "xxl_job_info"."trigger_status" IS '???????????????0-?????????1-??????';
COMMENT ON COLUMN "xxl_job_info"."trigger_last_time" IS '??????????????????';
COMMENT ON COLUMN "xxl_job_info"."trigger_next_time" IS '??????????????????';

-- ----------------------------
-- Records of xxl_job_info
-- ----------------------------
BEGIN;
INSERT INTO "xxl_job_info" VALUES (1, 1, '????????????1', '2018-11-03 22:21:31', '2018-11-03 22:21:31', 'XXL', '', 'CRON', '0 0 0 * * ? *', 'DO_NOTHING', 'FIRST', 'demoJobHandler', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE???????????????', '2018-11-03 22:21:31', '', 0, 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for xxl_job_lock
-- ----------------------------
DROP TABLE IF EXISTS "xxl_job_lock";
CREATE TABLE "xxl_job_lock" (
  "lock_name" varchar(50) COLLATE "pg_catalog"."default" NOT NULL
)
;
COMMENT ON COLUMN "xxl_job_lock"."lock_name" IS '?????????';

-- ----------------------------
-- Records of xxl_job_lock
-- ----------------------------
BEGIN;
INSERT INTO "xxl_job_lock" VALUES ('schedule_lock');
COMMIT;

-- ----------------------------
-- Table structure for xxl_job_log
-- ----------------------------
DROP TABLE IF EXISTS "xxl_job_log";
CREATE TABLE "xxl_job_log" (
  "id" int8 NOT NULL DEFAULT nextval('xxl_job_log_id_seq'::regclass),
  "job_group" int4 NOT NULL DEFAULT 0,
  "job_id" int4 NOT NULL DEFAULT 0,
  "executor_address" varchar(255) COLLATE "pg_catalog"."default",
  "executor_handler" varchar(255) COLLATE "pg_catalog"."default",
  "executor_param" varchar(512) COLLATE "pg_catalog"."default",
  "executor_sharding_param" varchar(20) COLLATE "pg_catalog"."default",
  "executor_fail_retry_count" int4 NOT NULL DEFAULT 0,
  "trigger_time" timestamp(6),
  "trigger_code" int4 NOT NULL DEFAULT 0,
  "trigger_msg" text COLLATE "pg_catalog"."default",
  "handle_time" timestamp(6),
  "handle_code" int4 NOT NULL DEFAULT 0,
  "handle_msg" text COLLATE "pg_catalog"."default",
  "alarm_status" int2 NOT NULL DEFAULT 0
)
;
COMMENT ON COLUMN "xxl_job_log"."job_group" IS '???????????????ID';
COMMENT ON COLUMN "xxl_job_log"."job_id" IS '???????????????ID';
COMMENT ON COLUMN "xxl_job_log"."executor_address" IS '???????????????????????????????????????';
COMMENT ON COLUMN "xxl_job_log"."executor_handler" IS '???????????????handler';
COMMENT ON COLUMN "xxl_job_log"."executor_param" IS '?????????????????????';
COMMENT ON COLUMN "xxl_job_log"."executor_sharding_param" IS '??????????????????????????????????????? 1/2';
COMMENT ON COLUMN "xxl_job_log"."executor_fail_retry_count" IS '??????????????????';
COMMENT ON COLUMN "xxl_job_log"."trigger_time" IS '??????-??????';
COMMENT ON COLUMN "xxl_job_log"."trigger_code" IS '??????-??????';
COMMENT ON COLUMN "xxl_job_log"."trigger_msg" IS '??????-??????';
COMMENT ON COLUMN "xxl_job_log"."handle_time" IS '??????-??????';
COMMENT ON COLUMN "xxl_job_log"."handle_code" IS '??????-??????';
COMMENT ON COLUMN "xxl_job_log"."handle_msg" IS '??????-??????';
COMMENT ON COLUMN "xxl_job_log"."alarm_status" IS '???????????????0-?????????1-???????????????2-???????????????3-????????????';

-- ----------------------------
-- Records of xxl_job_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for xxl_job_log_report
-- ----------------------------
DROP TABLE IF EXISTS "xxl_job_log_report";
CREATE TABLE "xxl_job_log_report" (
  "id" int4 NOT NULL DEFAULT nextval('xxl_job_log_report_id_seq'::regclass),
  "trigger_day" timestamp(6),
  "running_count" int4 NOT NULL DEFAULT 0,
  "suc_count" int4 NOT NULL DEFAULT 0,
  "fail_count" int4 NOT NULL,
  "update_time" timestamp(6)
)
;
COMMENT ON COLUMN "xxl_job_log_report"."trigger_day" IS '??????-??????';
COMMENT ON COLUMN "xxl_job_log_report"."running_count" IS '?????????-????????????';
COMMENT ON COLUMN "xxl_job_log_report"."suc_count" IS '????????????-????????????';
COMMENT ON COLUMN "xxl_job_log_report"."fail_count" IS '????????????-????????????';

-- ----------------------------
-- Records of xxl_job_log_report
-- ----------------------------
BEGIN;
INSERT INTO "xxl_job_log_report" VALUES (2, '2021-09-21 00:00:00', 0, 0, 0, NULL);
INSERT INTO "xxl_job_log_report" VALUES (3, '2021-09-20 00:00:00', 0, 0, 0, NULL);
INSERT INTO "xxl_job_log_report" VALUES (5, '2021-09-24 00:00:00', 0, 0, 0, NULL);
INSERT INTO "xxl_job_log_report" VALUES (4, '2021-09-23 00:00:00', 0, 0, 0, NULL);
INSERT INTO "xxl_job_log_report" VALUES (1, '2021-09-22 00:00:00', 0, 0, 0, NULL);
COMMIT;

-- ----------------------------
-- Table structure for xxl_job_logglue
-- ----------------------------
DROP TABLE IF EXISTS "xxl_job_logglue";
CREATE TABLE "xxl_job_logglue" (
  "id" int4 NOT NULL DEFAULT 0,
  "job_id" int4 NOT NULL DEFAULT 0,
  "glue_type" varchar(50) COLLATE "pg_catalog"."default",
  "glue_source" text COLLATE "pg_catalog"."default",
  "glue_remark" varchar(128) COLLATE "pg_catalog"."default" NOT NULL,
  "add_time" timestamp(6),
  "update_time" timestamp(6)
)
;
COMMENT ON COLUMN "xxl_job_logglue"."job_id" IS '???????????????ID';
COMMENT ON COLUMN "xxl_job_logglue"."glue_type" IS 'GLUE??????';
COMMENT ON COLUMN "xxl_job_logglue"."glue_source" IS 'GLUE?????????';
COMMENT ON COLUMN "xxl_job_logglue"."glue_remark" IS 'GLUE??????';

-- ----------------------------
-- Records of xxl_job_logglue
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for xxl_job_registry
-- ----------------------------
DROP TABLE IF EXISTS "xxl_job_registry";
CREATE TABLE "xxl_job_registry" (
  "id" int4 NOT NULL DEFAULT 0,
  "registry_group" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "registry_key" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "registry_value" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "update_time" timestamp(6)
)
;

-- ----------------------------
-- Records of xxl_job_registry
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for xxl_job_user
-- ----------------------------
DROP TABLE IF EXISTS "xxl_job_user";
CREATE TABLE "xxl_job_user" (
  "id" int4 NOT NULL DEFAULT 0,
  "username" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "password" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "role" int2 NOT NULL DEFAULT 0,
  "permission" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "xxl_job_user"."username" IS '??????';
COMMENT ON COLUMN "xxl_job_user"."password" IS '??????';
COMMENT ON COLUMN "xxl_job_user"."role" IS '?????????0-???????????????1-?????????';
COMMENT ON COLUMN "xxl_job_user"."permission" IS '??????????????????ID???????????????????????????';

-- ----------------------------
-- Records of xxl_job_user
-- ----------------------------
BEGIN;
INSERT INTO "xxl_job_user" VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL);
INSERT INTO "xxl_job_user" VALUES (0, 'asdf', '58a5bd4d1fe1914a7438e768c0627486', 0, '');
COMMIT;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"xxl_job_group_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"xxl_job_info_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"xxl_job_log_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"xxl_job_log_report_id_seq"', 6, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"xxl_job_logglue_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"xxl_job_registry_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"xxl_job_user_id_seq"', 2, false);

-- ----------------------------
-- Primary Key structure for table xxl_job_group
-- ----------------------------
ALTER TABLE "xxl_job_group" ADD CONSTRAINT "xxl_job_group_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table xxl_job_info
-- ----------------------------
ALTER TABLE "xxl_job_info" ADD CONSTRAINT "xxl_job_info_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table xxl_job_lock
-- ----------------------------
ALTER TABLE "xxl_job_lock" ADD CONSTRAINT "xxl_job_lock_pkey" PRIMARY KEY ("lock_name");

-- ----------------------------
-- Indexes structure for table xxl_job_log
-- ----------------------------
CREATE INDEX "I_handle_code" ON "xxl_job_log" USING btree (
  "handle_code" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "I_trigger_time" ON "xxl_job_log" USING btree (
  "trigger_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table xxl_job_log
-- ----------------------------
ALTER TABLE "xxl_job_log" ADD CONSTRAINT "xxl_job_log_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table xxl_job_log_report
-- ----------------------------
CREATE INDEX "i_trigger_day" ON "xxl_job_log_report" USING btree (
  "trigger_day" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table xxl_job_log_report
-- ----------------------------
ALTER TABLE "xxl_job_log_report" ADD CONSTRAINT "xxl_job_log_report_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table xxl_job_logglue
-- ----------------------------
ALTER TABLE "xxl_job_logglue" ADD CONSTRAINT "xxl_job_logglue_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table xxl_job_registry
-- ----------------------------
CREATE INDEX "i_g_k_v" ON "xxl_job_registry" USING btree (
  "registry_group" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "registry_key" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "registry_value" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table xxl_job_registry
-- ----------------------------
ALTER TABLE "xxl_job_registry" ADD CONSTRAINT "xxl_job_registry_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table xxl_job_user
-- ----------------------------
CREATE INDEX "i_username" ON "xxl_job_user" USING btree (
  "username" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table xxl_job_user
-- ----------------------------
ALTER TABLE "xxl_job_user" ADD CONSTRAINT "xxl_job_user_pkey" PRIMARY KEY ("id");

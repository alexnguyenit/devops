CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE public.salesorder__c (
	id uuid NOT NULL DEFAULT uuid_generate_v1(),
	created_at varchar(32) NULL,
	sf_id varchar(100) NULL,
	updated_at varchar(50) NULL,
	merchant varchar(30) NOT NULL,
	salesorder_number__c varchar(255) NULL
);

-- Column comments

COMMENT ON COLUMN public.salesorder__c.sf_id IS 'Mã Id SF';
COMMENT ON COLUMN public.salesorder__c.merchant IS 'Mã merchant: mpits, myvnpost';
COMMENT ON COLUMN public.salesorder__c.salesorder_number__c IS 'Mã salesorder number VNP';

CREATE TABLE public.receipt__c (
	id uuid NOT NULL DEFAULT uuid_generate_v1(),
	created_at varchar(32) NULL,
	sf_id varchar(100) NULL,
	updated_at varchar(50) NULL,
	merchant varchar(30) NOT NULL,
	external_receipt_id__c varchar(100) NULL
);

-- Column comments

COMMENT ON COLUMN public.receipt__c.sf_id IS 'Mã Id SF';
COMMENT ON COLUMN public.receipt__c.merchant IS 'Mã merchant: mpits, myvnpost';
COMMENT ON COLUMN public.receipt__c.external_receipt_id__c IS 'Mã External Receipt Id VNP';

CREATE TABLE public.package__c (
	id uuid NOT NULL DEFAULT uuid_generate_v1(),
	created_at varchar(32) NULL,
	sf_id varchar(100) NULL,
	updated_at varchar(50) NULL,
	merchant varchar(30) NOT NULL,
	package_number__c varchar(100) NULL
);

-- Column comments

COMMENT ON COLUMN public.package__c.sf_id IS 'Mã Id SF';
COMMENT ON COLUMN public.package__c.merchant IS 'Mã merchant: mpits, myvnpost';
COMMENT ON COLUMN public.package__c.package_number__c IS 'Mã Package Number của VNP';

CREATE TABLE public.opportunity (
	id uuid NOT NULL DEFAULT uuid_generate_v1(),
	created_at varchar(32) NULL,
	sf_id varchar(100) NULL,
	updated_at varchar(50) NULL,
	merchant varchar(30) NOT NULL
);

-- Column comments

COMMENT ON COLUMN public.opportunity.sf_id IS 'Mã Id SF';
COMMENT ON COLUMN public.opportunity.merchant IS 'Mã merchant: mpits, myvnpost';

CREATE TABLE public."lead" (
	id uuid NOT NULL DEFAULT uuid_generate_v1(),
	created_at varchar(32) NULL,
	sf_id varchar(100) NULL,
	updated_at varchar(50) NULL,
	merchant varchar(30) NOT NULL
);

-- Column comments

COMMENT ON COLUMN public."lead".sf_id IS 'Mã Id SF';
COMMENT ON COLUMN public."lead".merchant IS 'Mã merchant: mpits, myvnpost';

CREATE TABLE public.item__c (
	id uuid NOT NULL DEFAULT uuid_generate_v1(),
	created_at varchar(32) NULL,
	sf_id varchar(100) NULL,
	updated_at varchar(50) NULL,
	merchant varchar(30) NOT NULL,
	external_item_id__c varchar(100) NULL
);

-- Column comments

COMMENT ON COLUMN public.item__c.sf_id IS 'Mã Id SF';
COMMENT ON COLUMN public.item__c.merchant IS 'Mã merchant: mpits, myvnpost';
COMMENT ON COLUMN public.item__c.external_item_id__c IS 'Mã Item của VNP';

CREATE TABLE public.ho_tro__c (
	id uuid NOT NULL DEFAULT uuid_generate_v1(),
	created_at varchar(32) NULL,
	sf_id varchar(100) NULL,
	updated_at varchar(50) NULL,
	merchant varchar(30) NOT NULL,
	f_uuid__c uuid NULL
);

-- Column comments

COMMENT ON COLUMN public.ho_tro__c.sf_id IS 'Mã Id SF';
COMMENT ON COLUMN public.ho_tro__c.merchant IS 'Mã merchant: mpits, myvnpost';
COMMENT ON COLUMN public.ho_tro__c.f_uuid__c IS 'Mã Case foreign key';

CREATE TABLE public.gw_trackings (
	id uuid NOT NULL DEFAULT uuid_generate_v1(),
	status int2 NULL DEFAULT 0,
	created_at varchar(32) NULL,
	updated_at varchar(32) NULL,
	merchant varchar(50) NULL,
	sf_error text NULL,
	value jsonb NULL,
	"object" varchar(255) NOT NULL,
	operation varchar(50) NOT NULL,
	sf_job_id varchar(50) NULL DEFAULT 'NEW'::character varying,
	uuid__c uuid NOT NULL,
	sf_id varchar(50) NULL,
	"number" int2 NULL DEFAULT 0
);

-- Column comments

COMMENT ON COLUMN public.gw_trackings.id IS 'Mã Id';
COMMENT ON COLUMN public.gw_trackings.status IS 'Trạng thái: 1: oke, 0: default (job), 2: fail (job CRM)';
COMMENT ON COLUMN public.gw_trackings.merchant IS 'Mã merchant: MPITS, MYVNPOST ...';
COMMENT ON COLUMN public.gw_trackings.sf_error IS 'Lỗi trả về từ SF';
COMMENT ON COLUMN public.gw_trackings.value IS 'Data từ Merchant gửi lên';
COMMENT ON COLUMN public.gw_trackings."object" IS 'Tên object';
COMMENT ON COLUMN public.gw_trackings.operation IS 'Các loại: insert, update, upsert, delete';
COMMENT ON COLUMN public.gw_trackings.sf_job_id IS 'Mã Sf Job Id';
COMMENT ON COLUMN public.gw_trackings.uuid__c IS 'Mã UUID Gw Id cha';
COMMENT ON COLUMN public.gw_trackings.sf_id IS 'Mã SF ID';
COMMENT ON COLUMN public.gw_trackings."number" IS 'Số lần đẩy';

CREATE TABLE public.gw_sessions (
	id uuid NOT NULL DEFAULT uuid_generate_v1(),
	consumer_key varchar(255) NOT NULL,
	consumer_secret varchar(255) NULL,
	expired_at varchar(50) NULL,
	created_at varchar(255) NULL,
	access_token varchar(500) NULL,
	"name" varchar(255) NULL,
	url text NULL,
	auth jsonb NULL
);

-- Column comments

COMMENT ON COLUMN public.gw_sessions.consumer_key IS 'Client Key Contected App SF';
COMMENT ON COLUMN public.gw_sessions.consumer_secret IS 'Secret Key Contected App SF';
COMMENT ON COLUMN public.gw_sessions.expired_at IS 'Thời gian expired đã đc + so với thời gian tạo';
COMMENT ON COLUMN public.gw_sessions.created_at IS 'Thời điểm update và tạo bản ghi';
COMMENT ON COLUMN public.gw_sessions.access_token IS 'Token của SF';
COMMENT ON COLUMN public.gw_sessions."name" IS 'Tên APP';
COMMENT ON COLUMN public.gw_sessions.url IS 'Url webhook: https://1, https://2';
COMMENT ON COLUMN public.gw_sessions.auth IS 'basic, oauth, api key';

CREATE TABLE public.gw_realtime_logs (
	id uuid NOT NULL DEFAULT uuid_generate_v1(),
	status int2 NULL DEFAULT 0,
	created_at timestamptz NULL DEFAULT now(),
	merchant varchar(50) NULL,
	sf_error text NULL,
	value jsonb NULL,
	"object" varchar(255) NOT NULL,
	operation varchar(50) NOT NULL,
	sf_id varchar(50) NULL
);

-- Column comments

COMMENT ON COLUMN public.gw_realtime_logs.id IS 'Mã Id';
COMMENT ON COLUMN public.gw_realtime_logs.status IS 'Trạng thái: 1: oke, 0: default (job), 2: fail (job CRM)';
COMMENT ON COLUMN public.gw_realtime_logs.merchant IS 'Mã merchant: MPITS, MYVNPOST ...';
COMMENT ON COLUMN public.gw_realtime_logs.sf_error IS 'Lỗi trả về từ SF';
COMMENT ON COLUMN public.gw_realtime_logs.value IS 'Data từ Merchant gửi lên';
COMMENT ON COLUMN public.gw_realtime_logs."object" IS 'Tên object';
COMMENT ON COLUMN public.gw_realtime_logs.operation IS 'Các loại: insert, update, upsert, delete';
COMMENT ON COLUMN public.gw_realtime_logs.sf_id IS 'Mã SF ID';

CREATE TABLE public.gw_logs (
	id uuid NOT NULL DEFAULT uuid_generate_v1(),
	end_point varchar(255) NULL,
	merchant varchar(255) NULL,
	"method" varchar(255) NULL,
	total_request int4 NULL,
	created_at int4 NULL,
	save_at int4 NULL
);

CREATE TABLE public.gw_jobs (
	id uuid NOT NULL DEFAULT uuid_generate_v1(),
	pid varchar(50) NULL,
	operation varchar(50) NULL,
	"object" varchar(255) NULL,
	created_by_id varchar(30) NULL,
	created_date varchar(50) NULL,
	system_modstamp varchar(50) NULL,
	state varchar(20) NULL,
	concurrency_mode varchar(10) NULL,
	content_type varchar(50) NULL,
	api_version float4 NULL,
	content_url varchar(255) NULL,
	line_ending varchar(10) NULL,
	column_delimiter varchar(10) NULL,
	created_at varchar(32) NULL,
	job_id varchar(32) NULL,
	is_checked int2 NULL DEFAULT 0,
	merchant varchar(30) NULL,
	sf_error varchar(500) NULL,
	number_records_processed int4 NULL,
	number_records_failed int4 NULL
);

-- Column comments

COMMENT ON COLUMN public.gw_jobs.pid IS 'Id của Job CRM';
COMMENT ON COLUMN public.gw_jobs.operation IS 'Trường trả về từ Job SF';
COMMENT ON COLUMN public.gw_jobs."object" IS 'nt';
COMMENT ON COLUMN public.gw_jobs.created_by_id IS 'nt';
COMMENT ON COLUMN public.gw_jobs.created_date IS 'nt';
COMMENT ON COLUMN public.gw_jobs.system_modstamp IS 'nt';
COMMENT ON COLUMN public.gw_jobs.state IS 'nt';
COMMENT ON COLUMN public.gw_jobs.concurrency_mode IS 'nt';
COMMENT ON COLUMN public.gw_jobs.content_type IS 'nt';
COMMENT ON COLUMN public.gw_jobs.api_version IS 'nt';
COMMENT ON COLUMN public.gw_jobs.content_url IS 'nt';
COMMENT ON COLUMN public.gw_jobs.line_ending IS 'nt';
COMMENT ON COLUMN public.gw_jobs.column_delimiter IS 'nt';
COMMENT ON COLUMN public.gw_jobs.created_at IS 'Ngày tạo của hệ thống';
COMMENT ON COLUMN public.gw_jobs.job_id IS 'JOB ID của KUE';
COMMENT ON COLUMN public.gw_jobs.is_checked IS 'Trường để biết được job đã được check hay chưa, 1: là hoàn thành check, 0: là chưa đc check';
COMMENT ON COLUMN public.gw_jobs.merchant IS 'Mã merchant';
COMMENT ON COLUMN public.gw_jobs.sf_error IS 'Lỗi trả về từ Job Failed';
COMMENT ON COLUMN public.gw_jobs.number_records_processed IS 'Số record đã xử lý';
COMMENT ON COLUMN public.gw_jobs.number_records_failed IS 'Số bản ghi lỗi';

CREATE TABLE public.gw_call_logs (
	id uuid NOT NULL DEFAULT uuid_generate_v1(),
	status varchar(20) NULL,
	to_phone varchar(50) NULL,
	from_phone varchar(50) NULL,
	record_url varchar(5000) NULL,
	duration int4 NULL,
	call_id varchar(300) NULL,
	created_at int8 NULL,
	"type" varchar(255) NULL,
	"name" varchar(30) NULL,
	username varchar(255) NULL,
	answered_duration int4 NULL,
	id_sys varchar(100) NULL,
	cdrid varchar(100) NULL,
	refer varchar(50) NULL,
	callee_id varchar(300) NULL
);

CREATE TABLE public.contact (
	id uuid NOT NULL DEFAULT uuid_generate_v1(),
	created_at varchar(32) NULL,
	sf_id varchar(100) NULL,
	updated_at varchar(50) NULL,
	merchant varchar(30) NOT NULL
);

-- Column comments

COMMENT ON COLUMN public.contact.sf_id IS 'Mã Id SF';
COMMENT ON COLUMN public.contact.merchant IS 'Mã merchant: mpits, myvnpost';

CREATE TABLE public."case" (
	id uuid NOT NULL DEFAULT uuid_generate_v1(),
	created_at varchar(32) NULL,
	sf_id varchar(100) NULL,
	updated_at varchar(50) NULL,
	merchant varchar(30) NOT NULL
);

-- Column comments

COMMENT ON COLUMN public."case".merchant IS 'Mã merchant';

CREATE TABLE public.batch__c (
	id uuid NOT NULL DEFAULT uuid_generate_v1(),
	created_at varchar(32) NULL,
	sf_id varchar(100) NULL,
	updated_at varchar(50) NULL,
	merchant varchar(30) NOT NULL,
	batch_number__c varchar(100) NULL
);

-- Column comments

COMMENT ON COLUMN public.batch__c.sf_id IS 'Mã Id SF';
COMMENT ON COLUMN public.batch__c.merchant IS 'Mã merchant: mpits, myvnpost';
COMMENT ON COLUMN public.batch__c.batch_number__c IS 'Mã Batch number của VNP';

CREATE TABLE public.added_value_in_package__c (
	id uuid NOT NULL DEFAULT uuid_generate_v1(),
	created_at varchar(32) NULL,
	sf_id varchar(100) NULL,
	updated_at varchar(50) NULL,
	merchant varchar(30) NOT NULL,
	external_avp_id__c varchar(100) NULL
);

-- Column comments

COMMENT ON COLUMN public.added_value_in_package__c.sf_id IS 'Mã Id SF';
COMMENT ON COLUMN public.added_value_in_package__c.merchant IS 'Mã merchant: mpits, myvnpost';
COMMENT ON COLUMN public.added_value_in_package__c.external_avp_id__c IS 'Mã Added Value In Package VNP';

CREATE TABLE public.account (
	id uuid NOT NULL DEFAULT uuid_generate_v1(),
	created_at varchar(32) NULL,
	sf_id varchar(100) NULL,
	updated_at varchar(50) NULL,
	merchant varchar(30) NOT NULL
);

-- Column comments

COMMENT ON COLUMN public.account.sf_id IS 'Mã Id SF';
COMMENT ON COLUMN public.account.merchant IS 'Mã merchant: mpits, myvnpost';

CREATE TABLE public.vi_pham__c (
	id uuid NOT NULL DEFAULT uuid_generate_v1(),
	created_at varchar(32) NULL,
	sf_id varchar(100) NULL,
	updated_at varchar(50) NULL,
	merchant varchar(30) NOT NULL
);

-- Column comments

COMMENT ON COLUMN public.vi_pham__c.sf_id IS 'Mã Id SF';
COMMENT ON COLUMN public.vi_pham__c.merchant IS 'Mã merchant: mpits, myvnpost';


CREATE TABLE public.tien_trinh_xu_li__c (
	id uuid NOT NULL DEFAULT uuid_generate_v1(),
	created_at varchar(32) NULL,
	sf_id varchar(100) NULL,
	updated_at varchar(50) NULL,
	merchant varchar(30) NOT NULL
);

-- Column comments

COMMENT ON COLUMN public.tien_trinh_xu_li__c.sf_id IS 'Mã Id SF';
COMMENT ON COLUMN public.tien_trinh_xu_li__c.merchant IS 'Mã merchant: mpits, myvnpost';

CREATE TABLE public.task (
	id uuid NOT NULL DEFAULT uuid_generate_v1(),
	created_at varchar(32) NULL,
	sf_id varchar(100) NULL,
	updated_at varchar(50) NULL,
	merchant varchar(30) NOT NULL
);

-- Column comments

COMMENT ON COLUMN public.task.merchant IS 'Mã merchant';

CREATE TABLE public.status__c (
	id uuid NOT NULL DEFAULT uuid_generate_v1(),
	created_at varchar(32) NULL,
	sf_id varchar(100) NULL,
	updated_at varchar(50) NULL,
	merchant varchar(30) NOT NULL,
	external_status_id__c varchar(255) NULL
);

-- Column comments

COMMENT ON COLUMN public.status__c.sf_id IS 'Mã Id SF';
COMMENT ON COLUMN public.status__c.merchant IS 'Mã merchant: mpits, myvnpost';
COMMENT ON COLUMN public.status__c.external_status_id__c IS 'Mã Status VNP';

CREATE TABLE public.gw_memories (
	id uuid NOT NULL DEFAULT uuid_generate_v1(),
	memory_at varchar(32) NULL,
	"object" varchar(100) NULL,
	operation varchar(30) NULL,
	created_at varchar(32) NULL,
	memory_end_at varchar(32) NULL,
	job_id varchar(32) NULL,
	status int2 NULL DEFAULT 0,
	updated_at varchar(32) NULL,
	merchant varchar(30) NULL
);

-- Column comments

COMMENT ON COLUMN public.gw_memories.memory_at IS 'Time get data last';
COMMENT ON COLUMN public.gw_memories."object" IS 'Object in SF';
COMMENT ON COLUMN public.gw_memories.operation IS 'Insert, Update, Delete ...';
COMMENT ON COLUMN public.gw_memories.created_at IS 'Time now';
COMMENT ON COLUMN public.gw_memories.memory_end_at IS 'Time get data first';
COMMENT ON COLUMN public.gw_memories.job_id IS 'JOB ID của KUE';
COMMENT ON COLUMN public.gw_memories.status IS 'Trạng thái của job: 0 là start và 1 là oke';
COMMENT ON COLUMN public.gw_memories.updated_at IS 'Thời gian cập nhật';
COMMENT ON COLUMN public.gw_memories.merchant IS 'Mã merchant';


CREATE TABLE public.gw_case_mpit (
	id uuid NOT NULL DEFAULT uuid_generate_v1(),
	casenumber varchar NULL,
	acountid varchar NULL,
	nhan_vien_cskh__c varchar(255) NULL,
	nhom_dich_vu__c varchar(255) NULL,
	location_type__c varchar(255) NULL,
	service__c varchar(255) NULL,
	description text NULL,
	origin varchar(255) NULL,
	priority varchar(255) NULL,
	employee__c varchar(255) NULL,
	so_phieu_khieu_nai__c varchar(255) NULL,
	status varchar(255) NULL,
	tai_lieu_dinh_kem__c varchar(500) NULL,
	pos__c varchar(255) NULL,
	sales_order__c varchar(255) NULL,
	transactionid varchar(255) NULL,
	suppliedname varchar(500) NULL,
	contact_address__c varchar(255) NULL,
	contact_province__c varchar(255) NULL,
	contact_district__c varchar(255) NULL,
	contact_commune__c varchar(255) NULL,
	suppliedphone varchar(255) NULL,
	suppliedemail varchar(255) NULL,
	ng_y_ti_p_nh_n__c varchar(255) NULL,
	ma_khach_hang_di_san__c varchar(255) NULL,
	error varchar(500) NULL,
	sfid varchar(255) NULL,
	li_do_khieu_nai__c varchar(500) NULL,
	created_at timestamptz NULL DEFAULT now()
);

INSERT INTO public.gw_sessions (id,consumer_key,consumer_secret,expired_at,created_at,access_token,"name",url,auth) VALUES 
('33062ce0-9bc2-11eb-9a42-0242ac130002','3MVG9G9pzCUSkzZvLnOoNdZiIwqVt4NsCKE23uB64aiUN9NbcvehvzcK2x1pipZzva5SWVkmzs9XaVNgfwxow','$2a$11$3jvWQJnRwdkouQ6z.83dzezYPNvUAfZC1xa8OvhqyJKsCXMxTE0Em',NULL,'1618254394688',NULL,'CTEL',NULL,NULL)
,('55b54942-9bc2-11eb-aa36-0242ac130002','3MVG9G9pzCUSkzZvLnOoNdZiIwqobN0nBSWb2OUelQOZwZm.foDIaCR5OZzsznwblWJsPsIwa8xf.wvy7.GVE','$2a$11$wkJH0j9U8w2xY6sNL2xUaujXXdmsJ8U5v5nOqRvNwMLA7Tsedo/Jm',NULL,'1618254452879',NULL,'MyVNPost',NULL,NULL)
,('6b563b44-9bc2-11eb-8328-0242ac130002','3MVG9G9pzCUSkzZvLnOoNdZiIwql6EwFF0CekH08Lz0KJ2sXNFOsX25aUUy0tezlC0fWSqYn033itG206BlPB','$2a$11$/GYtwCI8wKZjuAoM1H7SEuhJ/TVVVTFTw.hFHLI8LXLIOZBNtf9j2',NULL,'1618254489166',NULL,'MPITS','http://case-uat.vnpost.vn:8040/GatewayAPI/MPITS_CRM/webhook/v1','{"type": "basic", "password": "mpit$2o19", "username": "mpits2019"}')
,('7c6266e0-9bc4-11eb-a045-0242ac130002','3MVG9G9pzCUSkzZvLnOoNdZiIwj_tksdiWkgmLnLluiLcegTVifSEdYHDDuX3_gY0P3Ee5vn4CXDM7OhAv.Wx','$2a$11$PhFV3lwd1vdQehlURtPl9.v9w3WJzzHaVOF.UnupxdfABr3FL/fx2',NULL,'1618255376761',NULL,'GateWay',NULL,NULL)
;

CREATE INDEX job_select_merchant_idx ON public.gw_trackings USING btree (sf_job_id, number, operation, status, merchant, object)
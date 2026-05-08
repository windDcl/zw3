-- Auto-generated from docs/faq-300-template.csv
-- Source rows: 300
-- Purpose: import the 300 FAQ seed records into gov_qa.faq and gov_qa.faq_alias
-- Notes:
--   1) This script is idempotent for FAQ and alias rows by using NOT EXISTS checks.
--   2) It preserves source category names exactly: 社保 / 公积金 / 计划生育.
--   3) Existing demo rows from init.sql are left untouched.

SET NAMES utf8mb4;
USE gov_qa;

START TRANSACTION;

-- Ensure categories used by the CSV exist
INSERT INTO category (name, sort_order, status) SELECT '社保', 10, 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM category WHERE name = '社保');
INSERT INTO category (name, sort_order, status) SELECT '公积金', 20, 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM category WHERE name = '公积金');
INSERT INTO category (name, sort_order, status) SELECT '计划生育', 30, 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM category WHERE name = '计划生育');

-- Import FAQ rows and aliases
-- 1. 社保 / 养老保险参保如何办理
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '养老保险参保如何办理', '养老保险参保属于常见的人社事项。最方便的做法是先在全国人社政务服务平台、国家社会保险公共服务平台或参保地人社经办机构上搜这个事项，看能不能直接线上办。能线上提交的，就按页面一步步填信息、传材料；线上办不了的，再带身份证和相关材料去窗口。先查入口再出门，通常能少跑一趟。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '养老保险参保如何办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '养老保险参保如何办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '养老保险参保怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '养老保险参保怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么办理养老保险参保' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么办理养老保险参保');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '养老保险参保去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '养老保险参保去哪里办');

-- 2. 社保 / 养老保险参保需要什么材料
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '养老保险参保需要什么材料', '养老保险参保属于常见的人社事项。一般先准备身份证，另外再按事项准备对应证明材料。很多人容易一上来准备一大堆，其实没必要，先去全国人社政务服务平台、国家社会保险公共服务平台或参保地人社经办机构看清单最省事；能系统核验的材料通常不用重复提交，页面提示缺什么再补什么。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '养老保险参保需要什么材料');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '养老保险参保需要什么材料' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '养老保险参保要带什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '养老保险参保要带什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '养老保险参保要准备哪些材料' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '养老保险参保要准备哪些材料');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '养老保险参保资料有哪些' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '养老保险参保资料有哪些');

-- 3. 社保 / 养老保险参保可以网上办理吗
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '养老保险参保可以网上办理吗', '养老保险参保属于常见的人社事项。现在很多地方都支持线上办，但不是所有地区、所有情形都一样。最稳的办法是先在全国人社政务服务平台、国家社会保险公共服务平台或参保地人社经办机构上搜索事项名称，能提交就直接线上办；如果页面提示要现场核验，再按提示去窗口，不用一开始就来回跑。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '养老保险参保可以网上办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '养老保险参保可以网上办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '养老保险参保能网上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '养老保险参保能网上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '养老保险参保可以线上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '养老保险参保可以线上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '养老保险参保手机上能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '养老保险参保手机上能办吗');

-- 4. 社保 / 养老保险参保在哪里办理
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '养老保险参保在哪里办理', '养老保险参保属于常见的人社事项。先别急着直接跑大厅，先在全国人社政务服务平台、国家社会保险公共服务平台或参保地人社经办机构查办理入口、受理机构和办公时间。能线上办的直接在线提交，必须现场办的，再去属地窗口。这样做最实际，能避免跑错地方或者排队后才发现材料不对。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '养老保险参保在哪里办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '养老保险参保在哪里办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '养老保险参保去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '养老保险参保去哪里办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '养老保险参保在哪办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '养老保险参保在哪办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '养老保险参保在哪个窗口办理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '养老保险参保在哪个窗口办理');

-- 5. 社保 / 养老保险参保办理后多久生效
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '养老保险参保办理后多久生效', '养老保险参保属于常见的人社事项。这个没有全国统一到“几天”的固定答案，通常要看你所在地区、材料是否齐全、系统能不能自动核验。对普通人来说，最关键不是死盯天数，而是先把信息一次填对、材料一次交齐，这样通常会快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '养老保险参保办理后多久生效');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '养老保险参保办理后多久生效' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '养老保险参保多久能办好' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '养老保险参保多久能办好');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '养老保险参保多久生效' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '养老保险参保多久生效');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '养老保险参保一般要几天' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '养老保险参保一般要几天');

-- 6. 社保 / 养老保险参保如何查询进度
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '养老保险参保如何查询进度', '养老保险参保属于常见的人社事项。如果你已经提交申请，通常先在全国人社政务服务平台、国家社会保险公共服务平台或参保地人社经办机构看有没有“我的办件”“办理进度”或查询入口。线上查不到时，再拿受理编号、身份证去窗口或打官方电话问。最有用的是把受理时间和编号先记下来，后面查起来快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '养老保险参保如何查询进度');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '养老保险参保如何查询进度' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '养老保险参保进度怎么查' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '养老保险参保进度怎么查');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '养老保险参保审核到哪了' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '养老保险参保审核到哪了');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么查养老保险参保办理进度' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么查养老保险参保办理进度');

-- 7. 社保 / 养老保险参保需要满足什么条件
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '养老保险参保需要满足什么条件', '养老保险参保属于常见的人社事项。先别急着准备材料，先看自己是不是符合基本条件。大多数人办不下来，不是不会操作，而是条件没对上。最稳的办法是先在全国人社政务服务平台、国家社会保险公共服务平台或参保地人社经办机构看适用对象、缴费要求、婚育情况或账户状态，再决定要不要申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '养老保险参保需要满足什么条件');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '养老保险参保需要满足什么条件' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '养老保险参保要什么条件' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '养老保险参保要什么条件');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '养老保险参保申请条件是什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '养老保险参保申请条件是什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '哪些人能办养老保险参保' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '哪些人能办养老保险参保');

-- 8. 社保 / 养老保险参保能否代办
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '养老保险参保能否代办', '养老保险参保属于常见的人社事项。很多事项不是完全不能代办，但代办时通常要多准备委托说明、双方身份证明或其他补充材料。你最好先在全国人社政务服务平台、国家社会保险公共服务平台或参保地人社经办机构查一下是否支持代办；如果本来就能本人线上办，通常自己操作会更快，也更不容易出错。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '养老保险参保能否代办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '养老保险参保能否代办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '养老保险参保可以代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '养老保险参保可以代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '养老保险参保能找人代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '养老保险参保能找人代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '养老保险参保能委托别人办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '养老保险参保能委托别人办吗');

-- 9. 社保 / 养老保险参保异地可以办理吗
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '养老保险参保异地可以办理吗', '养老保险参保属于常见的人社事项。现在不少事项已经支持异地办或跨省通办，但不是所有地方都完全打通。最实际的做法是先在全国人社政务服务平台、国家社会保险公共服务平台或参保地人社经办机构确认这个事项有没有异地入口；如果有就按流程在线提交，没有的话再问清楚是回原地办，还是在现居地先申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '养老保险参保异地可以办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '养老保险参保异地可以办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '养老保险参保外地能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '养老保险参保外地能办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '养老保险参保异地怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '养老保险参保异地怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '养老保险参保跨省能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '养老保险参保跨省能办吗');

-- 10. 社保 / 养老保险参保办理失败怎么办
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '养老保险参保办理失败怎么办', '养老保险参保属于常见的人社事项。别一被退回就重新乱提交，先看清楚退回原因。大多数情况无非是条件不符、材料不全、信息填错或系统核验不过。先把退回提示逐项改掉，再重新提交；如果提示看不懂，就直接找全国人社政务服务平台、国家社会保险公共服务平台或参保地人社经办机构对应的官方窗口或服务热线问清楚。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '养老保险参保办理失败怎么办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '养老保险参保办理失败怎么办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '养老保险参保办不下来怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '养老保险参保办不下来怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '养老保险参保被退回怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '养老保险参保被退回怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '养老保险参保申请失败怎么处理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '养老保险参保申请失败怎么处理');

-- 11. 社保 / 养老保险待遇申领如何办理
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '养老保险待遇申领如何办理', '养老保险待遇申领一般在待遇领取地办理。最方便的做法是先在全国人社政务服务平台、国家社会保险公共服务平台或待遇领取地经办机构上搜这个事项，看能不能直接线上办。能线上提交的，就按页面一步步填信息、传材料；线上办不了的，再带身份证和相关材料去窗口。先查入口再出门，通常能少跑一趟。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '养老保险待遇申领如何办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '养老保险待遇申领如何办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '养老保险待遇申领怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '养老保险待遇申领怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么办理养老保险待遇申领' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么办理养老保险待遇申领');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '养老保险待遇申领去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '养老保险待遇申领去哪里办');

-- 12. 社保 / 养老保险待遇申领需要什么材料
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '养老保险待遇申领需要什么材料', '养老保险待遇申领一般在待遇领取地办理。一般先准备身份证，另外再按事项准备对应证明材料。很多人容易一上来准备一大堆，其实没必要，先去全国人社政务服务平台、国家社会保险公共服务平台或待遇领取地经办机构看清单最省事；能系统核验的材料通常不用重复提交，页面提示缺什么再补什么。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '养老保险待遇申领需要什么材料');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '养老保险待遇申领需要什么材料' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '养老保险待遇申领要带什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '养老保险待遇申领要带什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '养老保险待遇申领要准备哪些材料' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '养老保险待遇申领要准备哪些材料');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '养老保险待遇申领资料有哪些' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '养老保险待遇申领资料有哪些');

-- 13. 社保 / 养老保险待遇申领可以网上办理吗
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '养老保险待遇申领可以网上办理吗', '养老保险待遇申领一般在待遇领取地办理。现在很多地方都支持线上办，但不是所有地区、所有情形都一样。最稳的办法是先在全国人社政务服务平台、国家社会保险公共服务平台或待遇领取地经办机构上搜索事项名称，能提交就直接线上办；如果页面提示要现场核验，再按提示去窗口，不用一开始就来回跑。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '养老保险待遇申领可以网上办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '养老保险待遇申领可以网上办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '养老保险待遇申领能网上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '养老保险待遇申领能网上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '养老保险待遇申领可以线上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '养老保险待遇申领可以线上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '养老保险待遇申领手机上能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '养老保险待遇申领手机上能办吗');

-- 14. 社保 / 养老保险待遇申领在哪里办理
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '养老保险待遇申领在哪里办理', '养老保险待遇申领一般在待遇领取地办理。先别急着直接跑大厅，先在全国人社政务服务平台、国家社会保险公共服务平台或待遇领取地经办机构查办理入口、受理机构和办公时间。能线上办的直接在线提交，必须现场办的，再去属地窗口。这样做最实际，能避免跑错地方或者排队后才发现材料不对。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '养老保险待遇申领在哪里办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '养老保险待遇申领在哪里办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '养老保险待遇申领去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '养老保险待遇申领去哪里办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '养老保险待遇申领在哪办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '养老保险待遇申领在哪办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '养老保险待遇申领在哪个窗口办理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '养老保险待遇申领在哪个窗口办理');

-- 15. 社保 / 养老保险待遇申领办理后多久生效
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '养老保险待遇申领办理后多久生效', '养老保险待遇申领一般在待遇领取地办理。这个没有全国统一到“几天”的固定答案，通常要看你所在地区、材料是否齐全、系统能不能自动核验。对普通人来说，最关键不是死盯天数，而是先把信息一次填对、材料一次交齐，这样通常会快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '养老保险待遇申领办理后多久生效');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '养老保险待遇申领办理后多久生效' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '养老保险待遇申领多久能办好' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '养老保险待遇申领多久能办好');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '养老保险待遇申领多久生效' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '养老保险待遇申领多久生效');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '养老保险待遇申领一般要几天' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '养老保险待遇申领一般要几天');

-- 16. 社保 / 养老保险待遇申领如何查询进度
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '养老保险待遇申领如何查询进度', '养老保险待遇申领一般在待遇领取地办理。如果你已经提交申请，通常先在全国人社政务服务平台、国家社会保险公共服务平台或待遇领取地经办机构看有没有“我的办件”“办理进度”或查询入口。线上查不到时，再拿受理编号、身份证去窗口或打官方电话问。最有用的是把受理时间和编号先记下来，后面查起来快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '养老保险待遇申领如何查询进度');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '养老保险待遇申领如何查询进度' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '养老保险待遇申领进度怎么查' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '养老保险待遇申领进度怎么查');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '养老保险待遇申领审核到哪了' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '养老保险待遇申领审核到哪了');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么查养老保险待遇申领办理进度' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么查养老保险待遇申领办理进度');

-- 17. 社保 / 养老保险待遇申领需要满足什么条件
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '养老保险待遇申领需要满足什么条件', '养老保险待遇申领一般在待遇领取地办理。先别急着准备材料，先看自己是不是符合基本条件。大多数人办不下来，不是不会操作，而是条件没对上。最稳的办法是先在全国人社政务服务平台、国家社会保险公共服务平台或待遇领取地经办机构看适用对象、缴费要求、婚育情况或账户状态，再决定要不要申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '养老保险待遇申领需要满足什么条件');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '养老保险待遇申领需要满足什么条件' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '养老保险待遇申领要什么条件' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '养老保险待遇申领要什么条件');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '养老保险待遇申领申请条件是什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '养老保险待遇申领申请条件是什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '哪些人能办养老保险待遇申领' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '哪些人能办养老保险待遇申领');

-- 18. 社保 / 养老保险待遇申领能否代办
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '养老保险待遇申领能否代办', '养老保险待遇申领一般在待遇领取地办理。很多事项不是完全不能代办，但代办时通常要多准备委托说明、双方身份证明或其他补充材料。你最好先在全国人社政务服务平台、国家社会保险公共服务平台或待遇领取地经办机构查一下是否支持代办；如果本来就能本人线上办，通常自己操作会更快，也更不容易出错。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '养老保险待遇申领能否代办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '养老保险待遇申领能否代办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '养老保险待遇申领可以代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '养老保险待遇申领可以代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '养老保险待遇申领能找人代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '养老保险待遇申领能找人代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '养老保险待遇申领能委托别人办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '养老保险待遇申领能委托别人办吗');

-- 19. 社保 / 养老保险待遇申领异地可以办理吗
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '养老保险待遇申领异地可以办理吗', '养老保险待遇申领一般在待遇领取地办理。现在不少事项已经支持异地办或跨省通办，但不是所有地方都完全打通。最实际的做法是先在全国人社政务服务平台、国家社会保险公共服务平台或待遇领取地经办机构确认这个事项有没有异地入口；如果有就按流程在线提交，没有的话再问清楚是回原地办，还是在现居地先申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '养老保险待遇申领异地可以办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '养老保险待遇申领异地可以办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '养老保险待遇申领外地能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '养老保险待遇申领外地能办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '养老保险待遇申领异地怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '养老保险待遇申领异地怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '养老保险待遇申领跨省能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '养老保险待遇申领跨省能办吗');

-- 20. 社保 / 养老保险待遇申领办理失败怎么办
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '养老保险待遇申领办理失败怎么办', '养老保险待遇申领一般在待遇领取地办理。别一被退回就重新乱提交，先看清楚退回原因。大多数情况无非是条件不符、材料不全、信息填错或系统核验不过。先把退回提示逐项改掉，再重新提交；如果提示看不懂，就直接找全国人社政务服务平台、国家社会保险公共服务平台或待遇领取地经办机构对应的官方窗口或服务热线问清楚。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '养老保险待遇申领办理失败怎么办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '养老保险待遇申领办理失败怎么办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '养老保险待遇申领办不下来怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '养老保险待遇申领办不下来怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '养老保险待遇申领被退回怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '养老保险待遇申领被退回怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '养老保险待遇申领申请失败怎么处理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '养老保险待遇申领申请失败怎么处理');

-- 21. 社保 / 医疗保险参保如何办理
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '医疗保险参保如何办理', '医保参保通常由当地医保部门统一受理。最方便的做法是先在国家医保服务平台、属地医保公共服务网或医保经办机构上搜这个事项，看能不能直接线上办。能线上提交的，就按页面一步步填信息、传材料；线上办不了的，再带身份证和相关材料去窗口。先查入口再出门，通常能少跑一趟。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '医疗保险参保如何办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '医疗保险参保如何办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '医疗保险参保怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '医疗保险参保怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么办理医疗保险参保' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么办理医疗保险参保');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '医疗保险参保去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '医疗保险参保去哪里办');

-- 22. 社保 / 医疗保险参保需要什么材料
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '医疗保险参保需要什么材料', '医保参保通常由当地医保部门统一受理。一般先准备身份证，另外再按事项准备对应证明材料。很多人容易一上来准备一大堆，其实没必要，先去国家医保服务平台、属地医保公共服务网或医保经办机构看清单最省事；能系统核验的材料通常不用重复提交，页面提示缺什么再补什么。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '医疗保险参保需要什么材料');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '医疗保险参保需要什么材料' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '医疗保险参保要带什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '医疗保险参保要带什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '医疗保险参保要准备哪些材料' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '医疗保险参保要准备哪些材料');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '医疗保险参保资料有哪些' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '医疗保险参保资料有哪些');

-- 23. 社保 / 医疗保险参保可以网上办理吗
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '医疗保险参保可以网上办理吗', '医保参保通常由当地医保部门统一受理。现在很多地方都支持线上办，但不是所有地区、所有情形都一样。最稳的办法是先在国家医保服务平台、属地医保公共服务网或医保经办机构上搜索事项名称，能提交就直接线上办；如果页面提示要现场核验，再按提示去窗口，不用一开始就来回跑。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '医疗保险参保可以网上办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '医疗保险参保可以网上办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '医疗保险参保能网上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '医疗保险参保能网上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '医疗保险参保可以线上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '医疗保险参保可以线上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '医疗保险参保手机上能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '医疗保险参保手机上能办吗');

-- 24. 社保 / 医疗保险参保在哪里办理
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '医疗保险参保在哪里办理', '医保参保通常由当地医保部门统一受理。先别急着直接跑大厅，先在国家医保服务平台、属地医保公共服务网或医保经办机构查办理入口、受理机构和办公时间。能线上办的直接在线提交，必须现场办的，再去属地窗口。这样做最实际，能避免跑错地方或者排队后才发现材料不对。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '医疗保险参保在哪里办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '医疗保险参保在哪里办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '医疗保险参保去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '医疗保险参保去哪里办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '医疗保险参保在哪办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '医疗保险参保在哪办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '医疗保险参保在哪个窗口办理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '医疗保险参保在哪个窗口办理');

-- 25. 社保 / 医疗保险参保办理后多久生效
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '医疗保险参保办理后多久生效', '医保参保通常由当地医保部门统一受理。这个没有全国统一到“几天”的固定答案，通常要看你所在地区、材料是否齐全、系统能不能自动核验。对普通人来说，最关键不是死盯天数，而是先把信息一次填对、材料一次交齐，这样通常会快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '医疗保险参保办理后多久生效');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '医疗保险参保办理后多久生效' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '医疗保险参保多久能办好' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '医疗保险参保多久能办好');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '医疗保险参保多久生效' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '医疗保险参保多久生效');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '医疗保险参保一般要几天' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '医疗保险参保一般要几天');

-- 26. 社保 / 医疗保险参保如何查询进度
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '医疗保险参保如何查询进度', '医保参保通常由当地医保部门统一受理。如果你已经提交申请，通常先在国家医保服务平台、属地医保公共服务网或医保经办机构看有没有“我的办件”“办理进度”或查询入口。线上查不到时，再拿受理编号、身份证去窗口或打官方电话问。最有用的是把受理时间和编号先记下来，后面查起来快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '医疗保险参保如何查询进度');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '医疗保险参保如何查询进度' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '医疗保险参保进度怎么查' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '医疗保险参保进度怎么查');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '医疗保险参保审核到哪了' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '医疗保险参保审核到哪了');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么查医疗保险参保办理进度' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么查医疗保险参保办理进度');

-- 27. 社保 / 医疗保险参保需要满足什么条件
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '医疗保险参保需要满足什么条件', '医保参保通常由当地医保部门统一受理。先别急着准备材料，先看自己是不是符合基本条件。大多数人办不下来，不是不会操作，而是条件没对上。最稳的办法是先在国家医保服务平台、属地医保公共服务网或医保经办机构看适用对象、缴费要求、婚育情况或账户状态，再决定要不要申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '医疗保险参保需要满足什么条件');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '医疗保险参保需要满足什么条件' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '医疗保险参保要什么条件' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '医疗保险参保要什么条件');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '医疗保险参保申请条件是什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '医疗保险参保申请条件是什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '哪些人能办医疗保险参保' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '哪些人能办医疗保险参保');

-- 28. 社保 / 医疗保险参保能否代办
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '医疗保险参保能否代办', '医保参保通常由当地医保部门统一受理。很多事项不是完全不能代办，但代办时通常要多准备委托说明、双方身份证明或其他补充材料。你最好先在国家医保服务平台、属地医保公共服务网或医保经办机构查一下是否支持代办；如果本来就能本人线上办，通常自己操作会更快，也更不容易出错。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '医疗保险参保能否代办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '医疗保险参保能否代办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '医疗保险参保可以代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '医疗保险参保可以代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '医疗保险参保能找人代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '医疗保险参保能找人代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '医疗保险参保能委托别人办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '医疗保险参保能委托别人办吗');

-- 29. 社保 / 医疗保险参保异地可以办理吗
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '医疗保险参保异地可以办理吗', '医保参保通常由当地医保部门统一受理。现在不少事项已经支持异地办或跨省通办，但不是所有地方都完全打通。最实际的做法是先在国家医保服务平台、属地医保公共服务网或医保经办机构确认这个事项有没有异地入口；如果有就按流程在线提交，没有的话再问清楚是回原地办，还是在现居地先申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '医疗保险参保异地可以办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '医疗保险参保异地可以办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '医疗保险参保外地能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '医疗保险参保外地能办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '医疗保险参保异地怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '医疗保险参保异地怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '医疗保险参保跨省能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '医疗保险参保跨省能办吗');

-- 30. 社保 / 医疗保险参保办理失败怎么办
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '医疗保险参保办理失败怎么办', '医保参保通常由当地医保部门统一受理。别一被退回就重新乱提交，先看清楚退回原因。大多数情况无非是条件不符、材料不全、信息填错或系统核验不过。先把退回提示逐项改掉，再重新提交；如果提示看不懂，就直接找国家医保服务平台、属地医保公共服务网或医保经办机构对应的官方窗口或服务热线问清楚。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '医疗保险参保办理失败怎么办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '医疗保险参保办理失败怎么办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '医疗保险参保办不下来怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '医疗保险参保办不下来怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '医疗保险参保被退回怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '医疗保险参保被退回怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '医疗保险参保申请失败怎么处理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '医疗保险参保申请失败怎么处理');

-- 31. 社保 / 医疗保险报销如何办理
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '医疗保险报销如何办理', '医保报销看的是参保地政策和就医结算规则。最方便的做法是先在国家医保服务平台、属地医保公共服务网或医保经办机构上搜这个事项，看能不能直接线上办。能线上提交的，就按页面一步步填信息、传材料；线上办不了的，再带身份证和相关材料去窗口。先查入口再出门，通常能少跑一趟。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '医疗保险报销如何办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '医疗保险报销如何办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '医疗保险报销怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '医疗保险报销怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么办理医疗保险报销' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么办理医疗保险报销');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '医疗保险报销去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '医疗保险报销去哪里办');

-- 32. 社保 / 医疗保险报销需要什么材料
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '医疗保险报销需要什么材料', '医保报销看的是参保地政策和就医结算规则。一般先准备身份证，另外再按事项准备对应证明材料。很多人容易一上来准备一大堆，其实没必要，先去国家医保服务平台、属地医保公共服务网或医保经办机构看清单最省事；能系统核验的材料通常不用重复提交，页面提示缺什么再补什么。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '医疗保险报销需要什么材料');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '医疗保险报销需要什么材料' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '医疗保险报销要带什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '医疗保险报销要带什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '医疗保险报销要准备哪些材料' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '医疗保险报销要准备哪些材料');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '医疗保险报销资料有哪些' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '医疗保险报销资料有哪些');

-- 33. 社保 / 医疗保险报销可以网上办理吗
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '医疗保险报销可以网上办理吗', '医保报销看的是参保地政策和就医结算规则。现在很多地方都支持线上办，但不是所有地区、所有情形都一样。最稳的办法是先在国家医保服务平台、属地医保公共服务网或医保经办机构上搜索事项名称，能提交就直接线上办；如果页面提示要现场核验，再按提示去窗口，不用一开始就来回跑。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '医疗保险报销可以网上办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '医疗保险报销可以网上办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '医疗保险报销能网上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '医疗保险报销能网上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '医疗保险报销可以线上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '医疗保险报销可以线上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '医疗保险报销手机上能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '医疗保险报销手机上能办吗');

-- 34. 社保 / 医疗保险报销在哪里办理
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '医疗保险报销在哪里办理', '医保报销看的是参保地政策和就医结算规则。先别急着直接跑大厅，先在国家医保服务平台、属地医保公共服务网或医保经办机构查办理入口、受理机构和办公时间。能线上办的直接在线提交，必须现场办的，再去属地窗口。这样做最实际，能避免跑错地方或者排队后才发现材料不对。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '医疗保险报销在哪里办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '医疗保险报销在哪里办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '医疗保险报销去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '医疗保险报销去哪里办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '医疗保险报销在哪办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '医疗保险报销在哪办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '医疗保险报销在哪个窗口办理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '医疗保险报销在哪个窗口办理');

-- 35. 社保 / 医疗保险报销办理后多久生效
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '医疗保险报销办理后多久生效', '医保报销看的是参保地政策和就医结算规则。这个没有全国统一到“几天”的固定答案，通常要看你所在地区、材料是否齐全、系统能不能自动核验。对普通人来说，最关键不是死盯天数，而是先把信息一次填对、材料一次交齐，这样通常会快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '医疗保险报销办理后多久生效');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '医疗保险报销办理后多久生效' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '医疗保险报销多久能办好' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '医疗保险报销多久能办好');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '医疗保险报销多久生效' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '医疗保险报销多久生效');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '医疗保险报销一般要几天' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '医疗保险报销一般要几天');

-- 36. 社保 / 医疗保险报销如何查询进度
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '医疗保险报销如何查询进度', '医保报销看的是参保地政策和就医结算规则。如果你已经提交申请，通常先在国家医保服务平台、属地医保公共服务网或医保经办机构看有没有“我的办件”“办理进度”或查询入口。线上查不到时，再拿受理编号、身份证去窗口或打官方电话问。最有用的是把受理时间和编号先记下来，后面查起来快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '医疗保险报销如何查询进度');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '医疗保险报销如何查询进度' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '医疗保险报销进度怎么查' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '医疗保险报销进度怎么查');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '医疗保险报销审核到哪了' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '医疗保险报销审核到哪了');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么查医疗保险报销办理进度' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么查医疗保险报销办理进度');

-- 37. 社保 / 医疗保险报销需要满足什么条件
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '医疗保险报销需要满足什么条件', '医保报销看的是参保地政策和就医结算规则。先别急着准备材料，先看自己是不是符合基本条件。大多数人办不下来，不是不会操作，而是条件没对上。最稳的办法是先在国家医保服务平台、属地医保公共服务网或医保经办机构看适用对象、缴费要求、婚育情况或账户状态，再决定要不要申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '医疗保险报销需要满足什么条件');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '医疗保险报销需要满足什么条件' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '医疗保险报销要什么条件' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '医疗保险报销要什么条件');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '医疗保险报销申请条件是什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '医疗保险报销申请条件是什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '哪些人能办医疗保险报销' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '哪些人能办医疗保险报销');

-- 38. 社保 / 医疗保险报销能否代办
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '医疗保险报销能否代办', '医保报销看的是参保地政策和就医结算规则。很多事项不是完全不能代办，但代办时通常要多准备委托说明、双方身份证明或其他补充材料。你最好先在国家医保服务平台、属地医保公共服务网或医保经办机构查一下是否支持代办；如果本来就能本人线上办，通常自己操作会更快，也更不容易出错。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '医疗保险报销能否代办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '医疗保险报销能否代办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '医疗保险报销可以代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '医疗保险报销可以代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '医疗保险报销能找人代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '医疗保险报销能找人代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '医疗保险报销能委托别人办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '医疗保险报销能委托别人办吗');

-- 39. 社保 / 医疗保险报销异地可以办理吗
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '医疗保险报销异地可以办理吗', '医保报销看的是参保地政策和就医结算规则。现在不少事项已经支持异地办或跨省通办，但不是所有地方都完全打通。最实际的做法是先在国家医保服务平台、属地医保公共服务网或医保经办机构确认这个事项有没有异地入口；如果有就按流程在线提交，没有的话再问清楚是回原地办，还是在现居地先申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '医疗保险报销异地可以办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '医疗保险报销异地可以办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '医疗保险报销外地能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '医疗保险报销外地能办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '医疗保险报销异地怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '医疗保险报销异地怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '医疗保险报销跨省能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '医疗保险报销跨省能办吗');

-- 40. 社保 / 医疗保险报销办理失败怎么办
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '医疗保险报销办理失败怎么办', '医保报销看的是参保地政策和就医结算规则。别一被退回就重新乱提交，先看清楚退回原因。大多数情况无非是条件不符、材料不全、信息填错或系统核验不过。先把退回提示逐项改掉，再重新提交；如果提示看不懂，就直接找国家医保服务平台、属地医保公共服务网或医保经办机构对应的官方窗口或服务热线问清楚。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '医疗保险报销办理失败怎么办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '医疗保险报销办理失败怎么办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '医疗保险报销办不下来怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '医疗保险报销办不下来怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '医疗保险报销被退回怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '医疗保险报销被退回怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '医疗保险报销申请失败怎么处理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '医疗保险报销申请失败怎么处理');

-- 41. 社保 / 异地就医备案如何办理
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '异地就医备案如何办理', '异地就医前先备案，很多时候能省下后面手工报销的麻烦。最方便的做法是先在国家医保服务平台、属地医保公共服务网或医保经办机构上搜这个事项，看能不能直接线上办。能线上提交的，就按页面一步步填信息、传材料；线上办不了的，再带身份证和相关材料去窗口。先查入口再出门，通常能少跑一趟。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '异地就医备案如何办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '异地就医备案如何办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '异地就医备案怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '异地就医备案怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么办理异地就医备案' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么办理异地就医备案');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '异地就医备案去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '异地就医备案去哪里办');

-- 42. 社保 / 异地就医备案需要什么材料
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '异地就医备案需要什么材料', '异地就医前先备案，很多时候能省下后面手工报销的麻烦。一般先准备身份证，另外再按事项准备对应证明材料。很多人容易一上来准备一大堆，其实没必要，先去国家医保服务平台、属地医保公共服务网或医保经办机构看清单最省事；能系统核验的材料通常不用重复提交，页面提示缺什么再补什么。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '异地就医备案需要什么材料');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '异地就医备案需要什么材料' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '异地就医备案要带什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '异地就医备案要带什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '异地就医备案要准备哪些材料' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '异地就医备案要准备哪些材料');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '异地就医备案资料有哪些' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '异地就医备案资料有哪些');

-- 43. 社保 / 异地就医备案可以网上办理吗
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '异地就医备案可以网上办理吗', '异地就医前先备案，很多时候能省下后面手工报销的麻烦。现在很多地方都支持线上办，但不是所有地区、所有情形都一样。最稳的办法是先在国家医保服务平台、属地医保公共服务网或医保经办机构上搜索事项名称，能提交就直接线上办；如果页面提示要现场核验，再按提示去窗口，不用一开始就来回跑。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '异地就医备案可以网上办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '异地就医备案可以网上办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '异地就医备案能网上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '异地就医备案能网上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '异地就医备案可以线上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '异地就医备案可以线上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '异地就医备案手机上能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '异地就医备案手机上能办吗');

-- 44. 社保 / 异地就医备案在哪里办理
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '异地就医备案在哪里办理', '异地就医前先备案，很多时候能省下后面手工报销的麻烦。先别急着直接跑大厅，先在国家医保服务平台、属地医保公共服务网或医保经办机构查办理入口、受理机构和办公时间。能线上办的直接在线提交，必须现场办的，再去属地窗口。这样做最实际，能避免跑错地方或者排队后才发现材料不对。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '异地就医备案在哪里办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '异地就医备案在哪里办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '异地就医备案去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '异地就医备案去哪里办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '异地就医备案在哪办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '异地就医备案在哪办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '异地就医备案在哪个窗口办理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '异地就医备案在哪个窗口办理');

-- 45. 社保 / 异地就医备案办理后多久生效
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '异地就医备案办理后多久生效', '异地就医前先备案，很多时候能省下后面手工报销的麻烦。这个没有全国统一到“几天”的固定答案，通常要看你所在地区、材料是否齐全、系统能不能自动核验。对普通人来说，最关键不是死盯天数，而是先把信息一次填对、材料一次交齐，这样通常会快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '异地就医备案办理后多久生效');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '异地就医备案办理后多久生效' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '异地就医备案多久能办好' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '异地就医备案多久能办好');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '异地就医备案多久生效' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '异地就医备案多久生效');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '异地就医备案一般要几天' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '异地就医备案一般要几天');

-- 46. 社保 / 异地就医备案如何查询进度
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '异地就医备案如何查询进度', '异地就医前先备案，很多时候能省下后面手工报销的麻烦。如果你已经提交申请，通常先在国家医保服务平台、属地医保公共服务网或医保经办机构看有没有“我的办件”“办理进度”或查询入口。线上查不到时，再拿受理编号、身份证去窗口或打官方电话问。最有用的是把受理时间和编号先记下来，后面查起来快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '异地就医备案如何查询进度');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '异地就医备案如何查询进度' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '异地就医备案进度怎么查' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '异地就医备案进度怎么查');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '异地就医备案审核到哪了' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '异地就医备案审核到哪了');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么查异地就医备案办理进度' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么查异地就医备案办理进度');

-- 47. 社保 / 异地就医备案需要满足什么条件
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '异地就医备案需要满足什么条件', '异地就医前先备案，很多时候能省下后面手工报销的麻烦。先别急着准备材料，先看自己是不是符合基本条件。大多数人办不下来，不是不会操作，而是条件没对上。最稳的办法是先在国家医保服务平台、属地医保公共服务网或医保经办机构看适用对象、缴费要求、婚育情况或账户状态，再决定要不要申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '异地就医备案需要满足什么条件');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '异地就医备案需要满足什么条件' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '异地就医备案要什么条件' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '异地就医备案要什么条件');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '异地就医备案申请条件是什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '异地就医备案申请条件是什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '哪些人能办异地就医备案' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '哪些人能办异地就医备案');

-- 48. 社保 / 异地就医备案能否代办
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '异地就医备案能否代办', '异地就医前先备案，很多时候能省下后面手工报销的麻烦。很多事项不是完全不能代办，但代办时通常要多准备委托说明、双方身份证明或其他补充材料。你最好先在国家医保服务平台、属地医保公共服务网或医保经办机构查一下是否支持代办；如果本来就能本人线上办，通常自己操作会更快，也更不容易出错。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '异地就医备案能否代办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '异地就医备案能否代办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '异地就医备案可以代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '异地就医备案可以代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '异地就医备案能找人代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '异地就医备案能找人代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '异地就医备案能委托别人办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '异地就医备案能委托别人办吗');

-- 49. 社保 / 异地就医备案异地可以办理吗
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '异地就医备案异地可以办理吗', '异地就医前先备案，很多时候能省下后面手工报销的麻烦。现在不少事项已经支持异地办或跨省通办，但不是所有地方都完全打通。最实际的做法是先在国家医保服务平台、属地医保公共服务网或医保经办机构确认这个事项有没有异地入口；如果有就按流程在线提交，没有的话再问清楚是回原地办，还是在现居地先申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '异地就医备案异地可以办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '异地就医备案异地可以办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '异地就医备案外地能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '异地就医备案外地能办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '异地就医备案异地怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '异地就医备案异地怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '异地就医备案跨省能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '异地就医备案跨省能办吗');

-- 50. 社保 / 异地就医备案办理失败怎么办
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '异地就医备案办理失败怎么办', '异地就医前先备案，很多时候能省下后面手工报销的麻烦。别一被退回就重新乱提交，先看清楚退回原因。大多数情况无非是条件不符、材料不全、信息填错或系统核验不过。先把退回提示逐项改掉，再重新提交；如果提示看不懂，就直接找国家医保服务平台、属地医保公共服务网或医保经办机构对应的官方窗口或服务热线问清楚。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '异地就医备案办理失败怎么办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '异地就医备案办理失败怎么办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '异地就医备案办不下来怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '异地就医备案办不下来怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '异地就医备案被退回怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '异地就医备案被退回怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '异地就医备案申请失败怎么处理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '异地就医备案申请失败怎么处理');

-- 51. 社保 / 社保关系转移接续如何办理
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '社保关系转移接续如何办理', '换城市工作后，社保关系转移是很常见的事。最方便的做法是先在全国人社政务服务平台、国家社会保险公共服务平台或参保地经办机构上搜这个事项，看能不能直接线上办。能线上提交的，就按页面一步步填信息、传材料；线上办不了的，再带身份证和相关材料去窗口。先查入口再出门，通常能少跑一趟。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '社保关系转移接续如何办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '社保关系转移接续如何办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社保关系转移接续怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社保关系转移接续怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么办理社保关系转移接续' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么办理社保关系转移接续');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社保关系转移接续去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社保关系转移接续去哪里办');

-- 52. 社保 / 社保关系转移接续需要什么材料
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '社保关系转移接续需要什么材料', '换城市工作后，社保关系转移是很常见的事。一般先准备身份证，另外再按事项准备对应证明材料。很多人容易一上来准备一大堆，其实没必要，先去全国人社政务服务平台、国家社会保险公共服务平台或参保地经办机构看清单最省事；能系统核验的材料通常不用重复提交，页面提示缺什么再补什么。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '社保关系转移接续需要什么材料');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '社保关系转移接续需要什么材料' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社保关系转移接续要带什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社保关系转移接续要带什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社保关系转移接续要准备哪些材料' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社保关系转移接续要准备哪些材料');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社保关系转移接续资料有哪些' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社保关系转移接续资料有哪些');

-- 53. 社保 / 社保关系转移接续可以网上办理吗
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '社保关系转移接续可以网上办理吗', '换城市工作后，社保关系转移是很常见的事。现在很多地方都支持线上办，但不是所有地区、所有情形都一样。最稳的办法是先在全国人社政务服务平台、国家社会保险公共服务平台或参保地经办机构上搜索事项名称，能提交就直接线上办；如果页面提示要现场核验，再按提示去窗口，不用一开始就来回跑。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '社保关系转移接续可以网上办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '社保关系转移接续可以网上办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社保关系转移接续能网上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社保关系转移接续能网上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社保关系转移接续可以线上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社保关系转移接续可以线上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社保关系转移接续手机上能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社保关系转移接续手机上能办吗');

-- 54. 社保 / 社保关系转移接续在哪里办理
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '社保关系转移接续在哪里办理', '换城市工作后，社保关系转移是很常见的事。先别急着直接跑大厅，先在全国人社政务服务平台、国家社会保险公共服务平台或参保地经办机构查办理入口、受理机构和办公时间。能线上办的直接在线提交，必须现场办的，再去属地窗口。这样做最实际，能避免跑错地方或者排队后才发现材料不对。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '社保关系转移接续在哪里办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '社保关系转移接续在哪里办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社保关系转移接续去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社保关系转移接续去哪里办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社保关系转移接续在哪办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社保关系转移接续在哪办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社保关系转移接续在哪个窗口办理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社保关系转移接续在哪个窗口办理');

-- 55. 社保 / 社保关系转移接续办理后多久生效
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '社保关系转移接续办理后多久生效', '换城市工作后，社保关系转移是很常见的事。这个没有全国统一到“几天”的固定答案，通常要看你所在地区、材料是否齐全、系统能不能自动核验。对普通人来说，最关键不是死盯天数，而是先把信息一次填对、材料一次交齐，这样通常会快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '社保关系转移接续办理后多久生效');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '社保关系转移接续办理后多久生效' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社保关系转移接续多久能办好' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社保关系转移接续多久能办好');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社保关系转移接续多久生效' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社保关系转移接续多久生效');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社保关系转移接续一般要几天' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社保关系转移接续一般要几天');

-- 56. 社保 / 社保关系转移接续如何查询进度
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '社保关系转移接续如何查询进度', '换城市工作后，社保关系转移是很常见的事。如果你已经提交申请，通常先在全国人社政务服务平台、国家社会保险公共服务平台或参保地经办机构看有没有“我的办件”“办理进度”或查询入口。线上查不到时，再拿受理编号、身份证去窗口或打官方电话问。最有用的是把受理时间和编号先记下来，后面查起来快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '社保关系转移接续如何查询进度');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '社保关系转移接续如何查询进度' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社保关系转移接续进度怎么查' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社保关系转移接续进度怎么查');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社保关系转移接续审核到哪了' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社保关系转移接续审核到哪了');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么查社保关系转移接续办理进度' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么查社保关系转移接续办理进度');

-- 57. 社保 / 社保关系转移接续需要满足什么条件
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '社保关系转移接续需要满足什么条件', '换城市工作后，社保关系转移是很常见的事。先别急着准备材料，先看自己是不是符合基本条件。大多数人办不下来，不是不会操作，而是条件没对上。最稳的办法是先在全国人社政务服务平台、国家社会保险公共服务平台或参保地经办机构看适用对象、缴费要求、婚育情况或账户状态，再决定要不要申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '社保关系转移接续需要满足什么条件');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '社保关系转移接续需要满足什么条件' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社保关系转移接续要什么条件' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社保关系转移接续要什么条件');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社保关系转移接续申请条件是什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社保关系转移接续申请条件是什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '哪些人能办社保关系转移接续' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '哪些人能办社保关系转移接续');

-- 58. 社保 / 社保关系转移接续能否代办
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '社保关系转移接续能否代办', '换城市工作后，社保关系转移是很常见的事。很多事项不是完全不能代办，但代办时通常要多准备委托说明、双方身份证明或其他补充材料。你最好先在全国人社政务服务平台、国家社会保险公共服务平台或参保地经办机构查一下是否支持代办；如果本来就能本人线上办，通常自己操作会更快，也更不容易出错。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '社保关系转移接续能否代办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '社保关系转移接续能否代办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社保关系转移接续可以代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社保关系转移接续可以代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社保关系转移接续能找人代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社保关系转移接续能找人代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社保关系转移接续能委托别人办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社保关系转移接续能委托别人办吗');

-- 59. 社保 / 社保关系转移接续异地可以办理吗
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '社保关系转移接续异地可以办理吗', '换城市工作后，社保关系转移是很常见的事。现在不少事项已经支持异地办或跨省通办，但不是所有地方都完全打通。最实际的做法是先在全国人社政务服务平台、国家社会保险公共服务平台或参保地经办机构确认这个事项有没有异地入口；如果有就按流程在线提交，没有的话再问清楚是回原地办，还是在现居地先申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '社保关系转移接续异地可以办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '社保关系转移接续异地可以办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社保关系转移接续外地能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社保关系转移接续外地能办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社保关系转移接续异地怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社保关系转移接续异地怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社保关系转移接续跨省能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社保关系转移接续跨省能办吗');

-- 60. 社保 / 社保关系转移接续办理失败怎么办
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '社保关系转移接续办理失败怎么办', '换城市工作后，社保关系转移是很常见的事。别一被退回就重新乱提交，先看清楚退回原因。大多数情况无非是条件不符、材料不全、信息填错或系统核验不过。先把退回提示逐项改掉，再重新提交；如果提示看不懂，就直接找全国人社政务服务平台、国家社会保险公共服务平台或参保地经办机构对应的官方窗口或服务热线问清楚。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '社保关系转移接续办理失败怎么办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '社保关系转移接续办理失败怎么办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社保关系转移接续办不下来怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社保关系转移接续办不下来怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社保关系转移接续被退回怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社保关系转移接续被退回怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社保关系转移接续申请失败怎么处理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社保关系转移接续申请失败怎么处理');

-- 61. 社保 / 社保缴费记录查询如何办理
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '社保缴费记录查询如何办理', '社保缴费记录大多数地方都能线上查。最方便的做法是先在全国人社政务服务平台、国家社会保险公共服务平台、电子社保卡渠道或属地经办机构上搜这个事项，看能不能直接线上办。能线上提交的，就按页面一步步填信息、传材料；线上办不了的，再带身份证和相关材料去窗口。先查入口再出门，通常能少跑一趟。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '社保缴费记录查询如何办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '社保缴费记录查询如何办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社保缴费记录查询怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社保缴费记录查询怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么办理社保缴费记录查询' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么办理社保缴费记录查询');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社保缴费记录查询去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社保缴费记录查询去哪里办');

-- 62. 社保 / 社保缴费记录查询需要什么材料
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '社保缴费记录查询需要什么材料', '社保缴费记录大多数地方都能线上查。一般先准备身份证，另外再按事项准备对应证明材料。很多人容易一上来准备一大堆，其实没必要，先去全国人社政务服务平台、国家社会保险公共服务平台、电子社保卡渠道或属地经办机构看清单最省事；能系统核验的材料通常不用重复提交，页面提示缺什么再补什么。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '社保缴费记录查询需要什么材料');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '社保缴费记录查询需要什么材料' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社保缴费记录查询要带什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社保缴费记录查询要带什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社保缴费记录查询要准备哪些材料' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社保缴费记录查询要准备哪些材料');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社保缴费记录查询资料有哪些' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社保缴费记录查询资料有哪些');

-- 63. 社保 / 社保缴费记录查询可以网上办理吗
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '社保缴费记录查询可以网上办理吗', '社保缴费记录大多数地方都能线上查。现在很多地方都支持线上办，但不是所有地区、所有情形都一样。最稳的办法是先在全国人社政务服务平台、国家社会保险公共服务平台、电子社保卡渠道或属地经办机构上搜索事项名称，能提交就直接线上办；如果页面提示要现场核验，再按提示去窗口，不用一开始就来回跑。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '社保缴费记录查询可以网上办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '社保缴费记录查询可以网上办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社保缴费记录查询能网上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社保缴费记录查询能网上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社保缴费记录查询可以线上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社保缴费记录查询可以线上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社保缴费记录查询手机上能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社保缴费记录查询手机上能办吗');

-- 64. 社保 / 社保缴费记录查询在哪里办理
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '社保缴费记录查询在哪里办理', '社保缴费记录大多数地方都能线上查。先别急着直接跑大厅，先在全国人社政务服务平台、国家社会保险公共服务平台、电子社保卡渠道或属地经办机构查办理入口、受理机构和办公时间。能线上办的直接在线提交，必须现场办的，再去属地窗口。这样做最实际，能避免跑错地方或者排队后才发现材料不对。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '社保缴费记录查询在哪里办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '社保缴费记录查询在哪里办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社保缴费记录查询去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社保缴费记录查询去哪里办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社保缴费记录查询在哪办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社保缴费记录查询在哪办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社保缴费记录查询在哪个窗口办理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社保缴费记录查询在哪个窗口办理');

-- 65. 社保 / 社保缴费记录查询办理后多久生效
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '社保缴费记录查询办理后多久生效', '社保缴费记录大多数地方都能线上查。这个没有全国统一到“几天”的固定答案，通常要看你所在地区、材料是否齐全、系统能不能自动核验。对普通人来说，最关键不是死盯天数，而是先把信息一次填对、材料一次交齐，这样通常会快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '社保缴费记录查询办理后多久生效');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '社保缴费记录查询办理后多久生效' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社保缴费记录查询多久能办好' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社保缴费记录查询多久能办好');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社保缴费记录查询多久生效' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社保缴费记录查询多久生效');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社保缴费记录查询一般要几天' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社保缴费记录查询一般要几天');

-- 66. 社保 / 社保缴费记录查询如何查询进度
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '社保缴费记录查询如何查询进度', '社保缴费记录大多数地方都能线上查。如果你已经提交申请，通常先在全国人社政务服务平台、国家社会保险公共服务平台、电子社保卡渠道或属地经办机构看有没有“我的办件”“办理进度”或查询入口。线上查不到时，再拿受理编号、身份证去窗口或打官方电话问。最有用的是把受理时间和编号先记下来，后面查起来快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '社保缴费记录查询如何查询进度');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '社保缴费记录查询如何查询进度' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社保缴费记录查询进度怎么查' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社保缴费记录查询进度怎么查');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社保缴费记录查询审核到哪了' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社保缴费记录查询审核到哪了');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么查社保缴费记录查询办理进度' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么查社保缴费记录查询办理进度');

-- 67. 社保 / 社保缴费记录查询需要满足什么条件
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '社保缴费记录查询需要满足什么条件', '社保缴费记录大多数地方都能线上查。先别急着准备材料，先看自己是不是符合基本条件。大多数人办不下来，不是不会操作，而是条件没对上。最稳的办法是先在全国人社政务服务平台、国家社会保险公共服务平台、电子社保卡渠道或属地经办机构看适用对象、缴费要求、婚育情况或账户状态，再决定要不要申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '社保缴费记录查询需要满足什么条件');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '社保缴费记录查询需要满足什么条件' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社保缴费记录查询要什么条件' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社保缴费记录查询要什么条件');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社保缴费记录查询申请条件是什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社保缴费记录查询申请条件是什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '哪些人能办社保缴费记录查询' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '哪些人能办社保缴费记录查询');

-- 68. 社保 / 社保缴费记录查询能否代办
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '社保缴费记录查询能否代办', '社保缴费记录大多数地方都能线上查。很多事项不是完全不能代办，但代办时通常要多准备委托说明、双方身份证明或其他补充材料。你最好先在全国人社政务服务平台、国家社会保险公共服务平台、电子社保卡渠道或属地经办机构查一下是否支持代办；如果本来就能本人线上办，通常自己操作会更快，也更不容易出错。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '社保缴费记录查询能否代办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '社保缴费记录查询能否代办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社保缴费记录查询可以代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社保缴费记录查询可以代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社保缴费记录查询能找人代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社保缴费记录查询能找人代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社保缴费记录查询能委托别人办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社保缴费记录查询能委托别人办吗');

-- 69. 社保 / 社保缴费记录查询异地可以办理吗
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '社保缴费记录查询异地可以办理吗', '社保缴费记录大多数地方都能线上查。现在不少事项已经支持异地办或跨省通办，但不是所有地方都完全打通。最实际的做法是先在全国人社政务服务平台、国家社会保险公共服务平台、电子社保卡渠道或属地经办机构确认这个事项有没有异地入口；如果有就按流程在线提交，没有的话再问清楚是回原地办，还是在现居地先申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '社保缴费记录查询异地可以办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '社保缴费记录查询异地可以办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社保缴费记录查询外地能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社保缴费记录查询外地能办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社保缴费记录查询异地怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社保缴费记录查询异地怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社保缴费记录查询跨省能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社保缴费记录查询跨省能办吗');

-- 70. 社保 / 社保缴费记录查询办理失败怎么办
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '社保缴费记录查询办理失败怎么办', '社保缴费记录大多数地方都能线上查。别一被退回就重新乱提交，先看清楚退回原因。大多数情况无非是条件不符、材料不全、信息填错或系统核验不过。先把退回提示逐项改掉，再重新提交；如果提示看不懂，就直接找全国人社政务服务平台、国家社会保险公共服务平台、电子社保卡渠道或属地经办机构对应的官方窗口或服务热线问清楚。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '社保缴费记录查询办理失败怎么办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '社保缴费记录查询办理失败怎么办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社保缴费记录查询办不下来怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社保缴费记录查询办不下来怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社保缴费记录查询被退回怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社保缴费记录查询被退回怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社保缴费记录查询申请失败怎么处理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社保缴费记录查询申请失败怎么处理');

-- 71. 社保 / 社会保障卡申领如何办理
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '社会保障卡申领如何办理', '社保卡申领现在比以前方便很多。最方便的做法是先在全国人社政务服务平台、电子社保卡渠道或属地社保卡服务网点上搜这个事项，看能不能直接线上办。能线上提交的，就按页面一步步填信息、传材料；线上办不了的，再带身份证和相关材料去窗口。先查入口再出门，通常能少跑一趟。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '社会保障卡申领如何办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '社会保障卡申领如何办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社会保障卡申领怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社会保障卡申领怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么办理社会保障卡申领' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么办理社会保障卡申领');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社会保障卡申领去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社会保障卡申领去哪里办');

-- 72. 社保 / 社会保障卡申领需要什么材料
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '社会保障卡申领需要什么材料', '社保卡申领现在比以前方便很多。一般先准备身份证，另外再按事项准备对应证明材料。很多人容易一上来准备一大堆，其实没必要，先去全国人社政务服务平台、电子社保卡渠道或属地社保卡服务网点看清单最省事；能系统核验的材料通常不用重复提交，页面提示缺什么再补什么。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '社会保障卡申领需要什么材料');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '社会保障卡申领需要什么材料' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社会保障卡申领要带什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社会保障卡申领要带什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社会保障卡申领要准备哪些材料' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社会保障卡申领要准备哪些材料');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社会保障卡申领资料有哪些' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社会保障卡申领资料有哪些');

-- 73. 社保 / 社会保障卡申领可以网上办理吗
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '社会保障卡申领可以网上办理吗', '社保卡申领现在比以前方便很多。现在很多地方都支持线上办，但不是所有地区、所有情形都一样。最稳的办法是先在全国人社政务服务平台、电子社保卡渠道或属地社保卡服务网点上搜索事项名称，能提交就直接线上办；如果页面提示要现场核验，再按提示去窗口，不用一开始就来回跑。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '社会保障卡申领可以网上办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '社会保障卡申领可以网上办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社会保障卡申领能网上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社会保障卡申领能网上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社会保障卡申领可以线上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社会保障卡申领可以线上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社会保障卡申领手机上能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社会保障卡申领手机上能办吗');

-- 74. 社保 / 社会保障卡申领在哪里办理
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '社会保障卡申领在哪里办理', '社保卡申领现在比以前方便很多。先别急着直接跑大厅，先在全国人社政务服务平台、电子社保卡渠道或属地社保卡服务网点查办理入口、受理机构和办公时间。能线上办的直接在线提交，必须现场办的，再去属地窗口。这样做最实际，能避免跑错地方或者排队后才发现材料不对。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '社会保障卡申领在哪里办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '社会保障卡申领在哪里办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社会保障卡申领去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社会保障卡申领去哪里办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社会保障卡申领在哪办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社会保障卡申领在哪办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社会保障卡申领在哪个窗口办理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社会保障卡申领在哪个窗口办理');

-- 75. 社保 / 社会保障卡申领办理后多久生效
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '社会保障卡申领办理后多久生效', '社保卡申领现在比以前方便很多。这个没有全国统一到“几天”的固定答案，通常要看你所在地区、材料是否齐全、系统能不能自动核验。对普通人来说，最关键不是死盯天数，而是先把信息一次填对、材料一次交齐，这样通常会快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '社会保障卡申领办理后多久生效');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '社会保障卡申领办理后多久生效' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社会保障卡申领多久能办好' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社会保障卡申领多久能办好');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社会保障卡申领多久生效' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社会保障卡申领多久生效');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社会保障卡申领一般要几天' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社会保障卡申领一般要几天');

-- 76. 社保 / 社会保障卡申领如何查询进度
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '社会保障卡申领如何查询进度', '社保卡申领现在比以前方便很多。如果你已经提交申请，通常先在全国人社政务服务平台、电子社保卡渠道或属地社保卡服务网点看有没有“我的办件”“办理进度”或查询入口。线上查不到时，再拿受理编号、身份证去窗口或打官方电话问。最有用的是把受理时间和编号先记下来，后面查起来快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '社会保障卡申领如何查询进度');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '社会保障卡申领如何查询进度' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社会保障卡申领进度怎么查' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社会保障卡申领进度怎么查');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社会保障卡申领审核到哪了' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社会保障卡申领审核到哪了');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么查社会保障卡申领办理进度' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么查社会保障卡申领办理进度');

-- 77. 社保 / 社会保障卡申领需要满足什么条件
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '社会保障卡申领需要满足什么条件', '社保卡申领现在比以前方便很多。先别急着准备材料，先看自己是不是符合基本条件。大多数人办不下来，不是不会操作，而是条件没对上。最稳的办法是先在全国人社政务服务平台、电子社保卡渠道或属地社保卡服务网点看适用对象、缴费要求、婚育情况或账户状态，再决定要不要申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '社会保障卡申领需要满足什么条件');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '社会保障卡申领需要满足什么条件' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社会保障卡申领要什么条件' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社会保障卡申领要什么条件');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社会保障卡申领申请条件是什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社会保障卡申领申请条件是什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '哪些人能办社会保障卡申领' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '哪些人能办社会保障卡申领');

-- 78. 社保 / 社会保障卡申领能否代办
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '社会保障卡申领能否代办', '社保卡申领现在比以前方便很多。很多事项不是完全不能代办，但代办时通常要多准备委托说明、双方身份证明或其他补充材料。你最好先在全国人社政务服务平台、电子社保卡渠道或属地社保卡服务网点查一下是否支持代办；如果本来就能本人线上办，通常自己操作会更快，也更不容易出错。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '社会保障卡申领能否代办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '社会保障卡申领能否代办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社会保障卡申领可以代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社会保障卡申领可以代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社会保障卡申领能找人代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社会保障卡申领能找人代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社会保障卡申领能委托别人办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社会保障卡申领能委托别人办吗');

-- 79. 社保 / 社会保障卡申领异地可以办理吗
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '社会保障卡申领异地可以办理吗', '社保卡申领现在比以前方便很多。现在不少事项已经支持异地办或跨省通办，但不是所有地方都完全打通。最实际的做法是先在全国人社政务服务平台、电子社保卡渠道或属地社保卡服务网点确认这个事项有没有异地入口；如果有就按流程在线提交，没有的话再问清楚是回原地办，还是在现居地先申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '社会保障卡申领异地可以办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '社会保障卡申领异地可以办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社会保障卡申领外地能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社会保障卡申领外地能办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社会保障卡申领异地怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社会保障卡申领异地怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社会保障卡申领跨省能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社会保障卡申领跨省能办吗');

-- 80. 社保 / 社会保障卡申领办理失败怎么办
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '社会保障卡申领办理失败怎么办', '社保卡申领现在比以前方便很多。别一被退回就重新乱提交，先看清楚退回原因。大多数情况无非是条件不符、材料不全、信息填错或系统核验不过。先把退回提示逐项改掉，再重新提交；如果提示看不懂，就直接找全国人社政务服务平台、电子社保卡渠道或属地社保卡服务网点对应的官方窗口或服务热线问清楚。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '社会保障卡申领办理失败怎么办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '社会保障卡申领办理失败怎么办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社会保障卡申领办不下来怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社会保障卡申领办不下来怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社会保障卡申领被退回怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社会保障卡申领被退回怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社会保障卡申领申请失败怎么处理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社会保障卡申领申请失败怎么处理');

-- 81. 社保 / 社会保障卡挂失补换如何办理
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '社会保障卡挂失补换如何办理', '社保卡丢了，先挂失再补卡，这个顺序别弄反。最方便的做法是先在全国人社政务服务平台、电子社保卡渠道或属地社保卡服务网点上搜这个事项，看能不能直接线上办。能线上提交的，就按页面一步步填信息、传材料；线上办不了的，再带身份证和相关材料去窗口。先查入口再出门，通常能少跑一趟。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '社会保障卡挂失补换如何办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '社会保障卡挂失补换如何办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社会保障卡挂失补换怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社会保障卡挂失补换怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么办理社会保障卡挂失补换' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么办理社会保障卡挂失补换');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社会保障卡挂失补换去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社会保障卡挂失补换去哪里办');

-- 82. 社保 / 社会保障卡挂失补换需要什么材料
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '社会保障卡挂失补换需要什么材料', '社保卡丢了，先挂失再补卡，这个顺序别弄反。一般先准备身份证，另外再按事项准备对应证明材料。很多人容易一上来准备一大堆，其实没必要，先去全国人社政务服务平台、电子社保卡渠道或属地社保卡服务网点看清单最省事；能系统核验的材料通常不用重复提交，页面提示缺什么再补什么。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '社会保障卡挂失补换需要什么材料');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '社会保障卡挂失补换需要什么材料' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社会保障卡挂失补换要带什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社会保障卡挂失补换要带什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社会保障卡挂失补换要准备哪些材料' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社会保障卡挂失补换要准备哪些材料');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社会保障卡挂失补换资料有哪些' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社会保障卡挂失补换资料有哪些');

-- 83. 社保 / 社会保障卡挂失补换可以网上办理吗
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '社会保障卡挂失补换可以网上办理吗', '社保卡丢了，先挂失再补卡，这个顺序别弄反。现在很多地方都支持线上办，但不是所有地区、所有情形都一样。最稳的办法是先在全国人社政务服务平台、电子社保卡渠道或属地社保卡服务网点上搜索事项名称，能提交就直接线上办；如果页面提示要现场核验，再按提示去窗口，不用一开始就来回跑。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '社会保障卡挂失补换可以网上办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '社会保障卡挂失补换可以网上办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社会保障卡挂失补换能网上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社会保障卡挂失补换能网上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社会保障卡挂失补换可以线上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社会保障卡挂失补换可以线上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社会保障卡挂失补换手机上能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社会保障卡挂失补换手机上能办吗');

-- 84. 社保 / 社会保障卡挂失补换在哪里办理
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '社会保障卡挂失补换在哪里办理', '社保卡丢了，先挂失再补卡，这个顺序别弄反。先别急着直接跑大厅，先在全国人社政务服务平台、电子社保卡渠道或属地社保卡服务网点查办理入口、受理机构和办公时间。能线上办的直接在线提交，必须现场办的，再去属地窗口。这样做最实际，能避免跑错地方或者排队后才发现材料不对。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '社会保障卡挂失补换在哪里办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '社会保障卡挂失补换在哪里办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社会保障卡挂失补换去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社会保障卡挂失补换去哪里办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社会保障卡挂失补换在哪办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社会保障卡挂失补换在哪办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社会保障卡挂失补换在哪个窗口办理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社会保障卡挂失补换在哪个窗口办理');

-- 85. 社保 / 社会保障卡挂失补换办理后多久生效
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '社会保障卡挂失补换办理后多久生效', '社保卡丢了，先挂失再补卡，这个顺序别弄反。这个没有全国统一到“几天”的固定答案，通常要看你所在地区、材料是否齐全、系统能不能自动核验。对普通人来说，最关键不是死盯天数，而是先把信息一次填对、材料一次交齐，这样通常会快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '社会保障卡挂失补换办理后多久生效');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '社会保障卡挂失补换办理后多久生效' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社会保障卡挂失补换多久能办好' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社会保障卡挂失补换多久能办好');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社会保障卡挂失补换多久生效' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社会保障卡挂失补换多久生效');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社会保障卡挂失补换一般要几天' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社会保障卡挂失补换一般要几天');

-- 86. 社保 / 社会保障卡挂失补换如何查询进度
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '社会保障卡挂失补换如何查询进度', '社保卡丢了，先挂失再补卡，这个顺序别弄反。如果你已经提交申请，通常先在全国人社政务服务平台、电子社保卡渠道或属地社保卡服务网点看有没有“我的办件”“办理进度”或查询入口。线上查不到时，再拿受理编号、身份证去窗口或打官方电话问。最有用的是把受理时间和编号先记下来，后面查起来快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '社会保障卡挂失补换如何查询进度');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '社会保障卡挂失补换如何查询进度' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社会保障卡挂失补换进度怎么查' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社会保障卡挂失补换进度怎么查');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社会保障卡挂失补换审核到哪了' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社会保障卡挂失补换审核到哪了');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么查社会保障卡挂失补换办理进度' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么查社会保障卡挂失补换办理进度');

-- 87. 社保 / 社会保障卡挂失补换需要满足什么条件
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '社会保障卡挂失补换需要满足什么条件', '社保卡丢了，先挂失再补卡，这个顺序别弄反。先别急着准备材料，先看自己是不是符合基本条件。大多数人办不下来，不是不会操作，而是条件没对上。最稳的办法是先在全国人社政务服务平台、电子社保卡渠道或属地社保卡服务网点看适用对象、缴费要求、婚育情况或账户状态，再决定要不要申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '社会保障卡挂失补换需要满足什么条件');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '社会保障卡挂失补换需要满足什么条件' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社会保障卡挂失补换要什么条件' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社会保障卡挂失补换要什么条件');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社会保障卡挂失补换申请条件是什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社会保障卡挂失补换申请条件是什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '哪些人能办社会保障卡挂失补换' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '哪些人能办社会保障卡挂失补换');

-- 88. 社保 / 社会保障卡挂失补换能否代办
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '社会保障卡挂失补换能否代办', '社保卡丢了，先挂失再补卡，这个顺序别弄反。很多事项不是完全不能代办，但代办时通常要多准备委托说明、双方身份证明或其他补充材料。你最好先在全国人社政务服务平台、电子社保卡渠道或属地社保卡服务网点查一下是否支持代办；如果本来就能本人线上办，通常自己操作会更快，也更不容易出错。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '社会保障卡挂失补换能否代办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '社会保障卡挂失补换能否代办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社会保障卡挂失补换可以代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社会保障卡挂失补换可以代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社会保障卡挂失补换能找人代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社会保障卡挂失补换能找人代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社会保障卡挂失补换能委托别人办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社会保障卡挂失补换能委托别人办吗');

-- 89. 社保 / 社会保障卡挂失补换异地可以办理吗
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '社会保障卡挂失补换异地可以办理吗', '社保卡丢了，先挂失再补卡，这个顺序别弄反。现在不少事项已经支持异地办或跨省通办，但不是所有地方都完全打通。最实际的做法是先在全国人社政务服务平台、电子社保卡渠道或属地社保卡服务网点确认这个事项有没有异地入口；如果有就按流程在线提交，没有的话再问清楚是回原地办，还是在现居地先申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '社会保障卡挂失补换异地可以办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '社会保障卡挂失补换异地可以办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社会保障卡挂失补换外地能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社会保障卡挂失补换外地能办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社会保障卡挂失补换异地怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社会保障卡挂失补换异地怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社会保障卡挂失补换跨省能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社会保障卡挂失补换跨省能办吗');

-- 90. 社保 / 社会保障卡挂失补换办理失败怎么办
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '社会保障卡挂失补换办理失败怎么办', '社保卡丢了，先挂失再补卡，这个顺序别弄反。别一被退回就重新乱提交，先看清楚退回原因。大多数情况无非是条件不符、材料不全、信息填错或系统核验不过。先把退回提示逐项改掉，再重新提交；如果提示看不懂，就直接找全国人社政务服务平台、电子社保卡渠道或属地社保卡服务网点对应的官方窗口或服务热线问清楚。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '社会保障卡挂失补换办理失败怎么办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '社会保障卡挂失补换办理失败怎么办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社会保障卡挂失补换办不下来怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社会保障卡挂失补换办不下来怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社会保障卡挂失补换被退回怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社会保障卡挂失补换被退回怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '社会保障卡挂失补换申请失败怎么处理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '社会保障卡挂失补换申请失败怎么处理');

-- 91. 社保 / 失业保险金申领如何办理
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '失业保险金申领如何办理', '失业保险金申领最关键的是先确认自己符不符合条件。最方便的做法是先在全国人社政务服务平台、国家社会保险公共服务平台、掌上12333或电子社保卡渠道上搜这个事项，看能不能直接线上办。能线上提交的，就按页面一步步填信息、传材料；线上办不了的，再带身份证和相关材料去窗口。先查入口再出门，通常能少跑一趟。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '失业保险金申领如何办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '失业保险金申领如何办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '失业保险金申领怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '失业保险金申领怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么办理失业保险金申领' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么办理失业保险金申领');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '失业保险金申领去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '失业保险金申领去哪里办');

-- 92. 社保 / 失业保险金申领需要什么材料
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '失业保险金申领需要什么材料', '失业保险金申领最关键的是先确认自己符不符合条件。一般先准备身份证，另外再按事项准备对应证明材料。很多人容易一上来准备一大堆，其实没必要，先去全国人社政务服务平台、国家社会保险公共服务平台、掌上12333或电子社保卡渠道看清单最省事；能系统核验的材料通常不用重复提交，页面提示缺什么再补什么。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '失业保险金申领需要什么材料');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '失业保险金申领需要什么材料' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '失业保险金申领要带什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '失业保险金申领要带什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '失业保险金申领要准备哪些材料' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '失业保险金申领要准备哪些材料');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '失业保险金申领资料有哪些' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '失业保险金申领资料有哪些');

-- 93. 社保 / 失业保险金申领可以网上办理吗
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '失业保险金申领可以网上办理吗', '失业保险金申领最关键的是先确认自己符不符合条件。现在很多地方都支持线上办，但不是所有地区、所有情形都一样。最稳的办法是先在全国人社政务服务平台、国家社会保险公共服务平台、掌上12333或电子社保卡渠道上搜索事项名称，能提交就直接线上办；如果页面提示要现场核验，再按提示去窗口，不用一开始就来回跑。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '失业保险金申领可以网上办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '失业保险金申领可以网上办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '失业保险金申领能网上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '失业保险金申领能网上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '失业保险金申领可以线上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '失业保险金申领可以线上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '失业保险金申领手机上能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '失业保险金申领手机上能办吗');

-- 94. 社保 / 失业保险金申领在哪里办理
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '失业保险金申领在哪里办理', '失业保险金申领最关键的是先确认自己符不符合条件。先别急着直接跑大厅，先在全国人社政务服务平台、国家社会保险公共服务平台、掌上12333或电子社保卡渠道查办理入口、受理机构和办公时间。能线上办的直接在线提交，必须现场办的，再去属地窗口。这样做最实际，能避免跑错地方或者排队后才发现材料不对。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '失业保险金申领在哪里办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '失业保险金申领在哪里办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '失业保险金申领去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '失业保险金申领去哪里办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '失业保险金申领在哪办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '失业保险金申领在哪办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '失业保险金申领在哪个窗口办理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '失业保险金申领在哪个窗口办理');

-- 95. 社保 / 失业保险金申领办理后多久生效
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '失业保险金申领办理后多久生效', '失业保险金申领最关键的是先确认自己符不符合条件。这个没有全国统一到“几天”的固定答案，通常要看你所在地区、材料是否齐全、系统能不能自动核验。对普通人来说，最关键不是死盯天数，而是先把信息一次填对、材料一次交齐，这样通常会快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '失业保险金申领办理后多久生效');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '失业保险金申领办理后多久生效' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '失业保险金申领多久能办好' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '失业保险金申领多久能办好');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '失业保险金申领多久生效' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '失业保险金申领多久生效');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '失业保险金申领一般要几天' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '失业保险金申领一般要几天');

-- 96. 社保 / 失业保险金申领如何查询进度
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '失业保险金申领如何查询进度', '失业保险金申领最关键的是先确认自己符不符合条件。如果你已经提交申请，通常先在全国人社政务服务平台、国家社会保险公共服务平台、掌上12333或电子社保卡渠道看有没有“我的办件”“办理进度”或查询入口。线上查不到时，再拿受理编号、身份证去窗口或打官方电话问。最有用的是把受理时间和编号先记下来，后面查起来快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '失业保险金申领如何查询进度');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '失业保险金申领如何查询进度' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '失业保险金申领进度怎么查' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '失业保险金申领进度怎么查');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '失业保险金申领审核到哪了' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '失业保险金申领审核到哪了');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么查失业保险金申领办理进度' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么查失业保险金申领办理进度');

-- 97. 社保 / 失业保险金申领需要满足什么条件
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '失业保险金申领需要满足什么条件', '失业保险金申领最关键的是先确认自己符不符合条件。先别急着准备材料，先看自己是不是符合基本条件。大多数人办不下来，不是不会操作，而是条件没对上。最稳的办法是先在全国人社政务服务平台、国家社会保险公共服务平台、掌上12333或电子社保卡渠道看适用对象、缴费要求、婚育情况或账户状态，再决定要不要申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '失业保险金申领需要满足什么条件');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '失业保险金申领需要满足什么条件' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '失业保险金申领要什么条件' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '失业保险金申领要什么条件');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '失业保险金申领申请条件是什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '失业保险金申领申请条件是什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '哪些人能办失业保险金申领' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '哪些人能办失业保险金申领');

-- 98. 社保 / 失业保险金申领能否代办
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '失业保险金申领能否代办', '失业保险金申领最关键的是先确认自己符不符合条件。很多事项不是完全不能代办，但代办时通常要多准备委托说明、双方身份证明或其他补充材料。你最好先在全国人社政务服务平台、国家社会保险公共服务平台、掌上12333或电子社保卡渠道查一下是否支持代办；如果本来就能本人线上办，通常自己操作会更快，也更不容易出错。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '失业保险金申领能否代办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '失业保险金申领能否代办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '失业保险金申领可以代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '失业保险金申领可以代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '失业保险金申领能找人代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '失业保险金申领能找人代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '失业保险金申领能委托别人办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '失业保险金申领能委托别人办吗');

-- 99. 社保 / 失业保险金申领异地可以办理吗
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '失业保险金申领异地可以办理吗', '失业保险金申领最关键的是先确认自己符不符合条件。现在不少事项已经支持异地办或跨省通办，但不是所有地方都完全打通。最实际的做法是先在全国人社政务服务平台、国家社会保险公共服务平台、掌上12333或电子社保卡渠道确认这个事项有没有异地入口；如果有就按流程在线提交，没有的话再问清楚是回原地办，还是在现居地先申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '失业保险金申领异地可以办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '失业保险金申领异地可以办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '失业保险金申领外地能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '失业保险金申领外地能办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '失业保险金申领异地怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '失业保险金申领异地怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '失业保险金申领跨省能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '失业保险金申领跨省能办吗');

-- 100. 社保 / 失业保险金申领办理失败怎么办
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '失业保险金申领办理失败怎么办', '失业保险金申领最关键的是先确认自己符不符合条件。别一被退回就重新乱提交，先看清楚退回原因。大多数情况无非是条件不符、材料不全、信息填错或系统核验不过。先把退回提示逐项改掉，再重新提交；如果提示看不懂，就直接找全国人社政务服务平台、国家社会保险公共服务平台、掌上12333或电子社保卡渠道对应的官方窗口或服务热线问清楚。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '失业保险金申领办理失败怎么办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '失业保险金申领办理失败怎么办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '失业保险金申领办不下来怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '失业保险金申领办不下来怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '失业保险金申领被退回怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '失业保险金申领被退回怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '失业保险金申领申请失败怎么处理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '失业保险金申领申请失败怎么处理');

-- 101. 社保 / 工伤保险待遇申请如何办理
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '工伤保险待遇申请如何办理', '工伤待遇不是直接领钱，通常要先走认定和审核流程。最方便的做法是先在全国人社政务服务平台、属地人社经办机构或工伤保险服务窗口上搜这个事项，看能不能直接线上办。能线上提交的，就按页面一步步填信息、传材料；线上办不了的，再带身份证和相关材料去窗口。先查入口再出门，通常能少跑一趟。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '工伤保险待遇申请如何办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '工伤保险待遇申请如何办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '工伤保险待遇申请怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '工伤保险待遇申请怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么办理工伤保险待遇申请' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么办理工伤保险待遇申请');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '工伤保险待遇申请去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '工伤保险待遇申请去哪里办');

-- 102. 社保 / 工伤保险待遇申请需要什么材料
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '工伤保险待遇申请需要什么材料', '工伤待遇不是直接领钱，通常要先走认定和审核流程。一般先准备身份证，另外再按事项准备对应证明材料。很多人容易一上来准备一大堆，其实没必要，先去全国人社政务服务平台、属地人社经办机构或工伤保险服务窗口看清单最省事；能系统核验的材料通常不用重复提交，页面提示缺什么再补什么。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '工伤保险待遇申请需要什么材料');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '工伤保险待遇申请需要什么材料' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '工伤保险待遇申请要带什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '工伤保险待遇申请要带什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '工伤保险待遇申请要准备哪些材料' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '工伤保险待遇申请要准备哪些材料');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '工伤保险待遇申请资料有哪些' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '工伤保险待遇申请资料有哪些');

-- 103. 社保 / 工伤保险待遇申请可以网上办理吗
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '工伤保险待遇申请可以网上办理吗', '工伤待遇不是直接领钱，通常要先走认定和审核流程。现在很多地方都支持线上办，但不是所有地区、所有情形都一样。最稳的办法是先在全国人社政务服务平台、属地人社经办机构或工伤保险服务窗口上搜索事项名称，能提交就直接线上办；如果页面提示要现场核验，再按提示去窗口，不用一开始就来回跑。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '工伤保险待遇申请可以网上办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '工伤保险待遇申请可以网上办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '工伤保险待遇申请能网上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '工伤保险待遇申请能网上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '工伤保险待遇申请可以线上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '工伤保险待遇申请可以线上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '工伤保险待遇申请手机上能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '工伤保险待遇申请手机上能办吗');

-- 104. 社保 / 工伤保险待遇申请在哪里办理
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '工伤保险待遇申请在哪里办理', '工伤待遇不是直接领钱，通常要先走认定和审核流程。先别急着直接跑大厅，先在全国人社政务服务平台、属地人社经办机构或工伤保险服务窗口查办理入口、受理机构和办公时间。能线上办的直接在线提交，必须现场办的，再去属地窗口。这样做最实际，能避免跑错地方或者排队后才发现材料不对。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '工伤保险待遇申请在哪里办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '工伤保险待遇申请在哪里办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '工伤保险待遇申请去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '工伤保险待遇申请去哪里办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '工伤保险待遇申请在哪办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '工伤保险待遇申请在哪办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '工伤保险待遇申请在哪个窗口办理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '工伤保险待遇申请在哪个窗口办理');

-- 105. 社保 / 工伤保险待遇申请办理后多久生效
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '工伤保险待遇申请办理后多久生效', '工伤待遇不是直接领钱，通常要先走认定和审核流程。这个没有全国统一到“几天”的固定答案，通常要看你所在地区、材料是否齐全、系统能不能自动核验。对普通人来说，最关键不是死盯天数，而是先把信息一次填对、材料一次交齐，这样通常会快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '工伤保险待遇申请办理后多久生效');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '工伤保险待遇申请办理后多久生效' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '工伤保险待遇申请多久能办好' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '工伤保险待遇申请多久能办好');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '工伤保险待遇申请多久生效' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '工伤保险待遇申请多久生效');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '工伤保险待遇申请一般要几天' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '工伤保险待遇申请一般要几天');

-- 106. 社保 / 工伤保险待遇申请如何查询进度
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '工伤保险待遇申请如何查询进度', '工伤待遇不是直接领钱，通常要先走认定和审核流程。如果你已经提交申请，通常先在全国人社政务服务平台、属地人社经办机构或工伤保险服务窗口看有没有“我的办件”“办理进度”或查询入口。线上查不到时，再拿受理编号、身份证去窗口或打官方电话问。最有用的是把受理时间和编号先记下来，后面查起来快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '工伤保险待遇申请如何查询进度');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '工伤保险待遇申请如何查询进度' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '工伤保险待遇申请进度怎么查' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '工伤保险待遇申请进度怎么查');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '工伤保险待遇申请审核到哪了' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '工伤保险待遇申请审核到哪了');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么查工伤保险待遇申请办理进度' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么查工伤保险待遇申请办理进度');

-- 107. 社保 / 工伤保险待遇申请需要满足什么条件
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '工伤保险待遇申请需要满足什么条件', '工伤待遇不是直接领钱，通常要先走认定和审核流程。先别急着准备材料，先看自己是不是符合基本条件。大多数人办不下来，不是不会操作，而是条件没对上。最稳的办法是先在全国人社政务服务平台、属地人社经办机构或工伤保险服务窗口看适用对象、缴费要求、婚育情况或账户状态，再决定要不要申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '工伤保险待遇申请需要满足什么条件');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '工伤保险待遇申请需要满足什么条件' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '工伤保险待遇申请要什么条件' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '工伤保险待遇申请要什么条件');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '工伤保险待遇申请申请条件是什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '工伤保险待遇申请申请条件是什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '哪些人能办工伤保险待遇申请' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '哪些人能办工伤保险待遇申请');

-- 108. 社保 / 工伤保险待遇申请能否代办
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '工伤保险待遇申请能否代办', '工伤待遇不是直接领钱，通常要先走认定和审核流程。很多事项不是完全不能代办，但代办时通常要多准备委托说明、双方身份证明或其他补充材料。你最好先在全国人社政务服务平台、属地人社经办机构或工伤保险服务窗口查一下是否支持代办；如果本来就能本人线上办，通常自己操作会更快，也更不容易出错。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '工伤保险待遇申请能否代办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '工伤保险待遇申请能否代办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '工伤保险待遇申请可以代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '工伤保险待遇申请可以代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '工伤保险待遇申请能找人代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '工伤保险待遇申请能找人代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '工伤保险待遇申请能委托别人办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '工伤保险待遇申请能委托别人办吗');

-- 109. 社保 / 工伤保险待遇申请异地可以办理吗
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '工伤保险待遇申请异地可以办理吗', '工伤待遇不是直接领钱，通常要先走认定和审核流程。现在不少事项已经支持异地办或跨省通办，但不是所有地方都完全打通。最实际的做法是先在全国人社政务服务平台、属地人社经办机构或工伤保险服务窗口确认这个事项有没有异地入口；如果有就按流程在线提交，没有的话再问清楚是回原地办，还是在现居地先申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '工伤保险待遇申请异地可以办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '工伤保险待遇申请异地可以办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '工伤保险待遇申请外地能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '工伤保险待遇申请外地能办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '工伤保险待遇申请异地怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '工伤保险待遇申请异地怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '工伤保险待遇申请跨省能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '工伤保险待遇申请跨省能办吗');

-- 110. 社保 / 工伤保险待遇申请办理失败怎么办
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '工伤保险待遇申请办理失败怎么办', '工伤待遇不是直接领钱，通常要先走认定和审核流程。别一被退回就重新乱提交，先看清楚退回原因。大多数情况无非是条件不符、材料不全、信息填错或系统核验不过。先把退回提示逐项改掉，再重新提交；如果提示看不懂，就直接找全国人社政务服务平台、属地人社经办机构或工伤保险服务窗口对应的官方窗口或服务热线问清楚。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '工伤保险待遇申请办理失败怎么办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '工伤保险待遇申请办理失败怎么办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '工伤保险待遇申请办不下来怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '工伤保险待遇申请办不下来怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '工伤保险待遇申请被退回怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '工伤保险待遇申请被退回怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '工伤保险待遇申请申请失败怎么处理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '工伤保险待遇申请申请失败怎么处理');

-- 111. 社保 / 灵活就业人员社保参保如何办理
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '灵活就业人员社保参保如何办理', '没有单位也能按灵活就业身份参保。最方便的做法是先在全国人社政务服务平台、属地人社经办机构或医保经办机构上搜这个事项，看能不能直接线上办。能线上提交的，就按页面一步步填信息、传材料；线上办不了的，再带身份证和相关材料去窗口。先查入口再出门，通常能少跑一趟。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '灵活就业人员社保参保如何办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '灵活就业人员社保参保如何办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '灵活就业人员社保参保怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '灵活就业人员社保参保怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么办理灵活就业人员社保参保' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么办理灵活就业人员社保参保');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '灵活就业人员社保参保去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '灵活就业人员社保参保去哪里办');

-- 112. 社保 / 灵活就业人员社保参保需要什么材料
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '灵活就业人员社保参保需要什么材料', '没有单位也能按灵活就业身份参保。一般先准备身份证，另外再按事项准备对应证明材料。很多人容易一上来准备一大堆，其实没必要，先去全国人社政务服务平台、属地人社经办机构或医保经办机构看清单最省事；能系统核验的材料通常不用重复提交，页面提示缺什么再补什么。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '灵活就业人员社保参保需要什么材料');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '灵活就业人员社保参保需要什么材料' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '灵活就业人员社保参保要带什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '灵活就业人员社保参保要带什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '灵活就业人员社保参保要准备哪些材料' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '灵活就业人员社保参保要准备哪些材料');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '灵活就业人员社保参保资料有哪些' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '灵活就业人员社保参保资料有哪些');

-- 113. 社保 / 灵活就业人员社保参保可以网上办理吗
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '灵活就业人员社保参保可以网上办理吗', '没有单位也能按灵活就业身份参保。现在很多地方都支持线上办，但不是所有地区、所有情形都一样。最稳的办法是先在全国人社政务服务平台、属地人社经办机构或医保经办机构上搜索事项名称，能提交就直接线上办；如果页面提示要现场核验，再按提示去窗口，不用一开始就来回跑。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '灵活就业人员社保参保可以网上办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '灵活就业人员社保参保可以网上办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '灵活就业人员社保参保能网上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '灵活就业人员社保参保能网上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '灵活就业人员社保参保可以线上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '灵活就业人员社保参保可以线上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '灵活就业人员社保参保手机上能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '灵活就业人员社保参保手机上能办吗');

-- 114. 社保 / 灵活就业人员社保参保在哪里办理
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '灵活就业人员社保参保在哪里办理', '没有单位也能按灵活就业身份参保。先别急着直接跑大厅，先在全国人社政务服务平台、属地人社经办机构或医保经办机构查办理入口、受理机构和办公时间。能线上办的直接在线提交，必须现场办的，再去属地窗口。这样做最实际，能避免跑错地方或者排队后才发现材料不对。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '灵活就业人员社保参保在哪里办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '灵活就业人员社保参保在哪里办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '灵活就业人员社保参保去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '灵活就业人员社保参保去哪里办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '灵活就业人员社保参保在哪办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '灵活就业人员社保参保在哪办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '灵活就业人员社保参保在哪个窗口办理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '灵活就业人员社保参保在哪个窗口办理');

-- 115. 社保 / 灵活就业人员社保参保办理后多久生效
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '灵活就业人员社保参保办理后多久生效', '没有单位也能按灵活就业身份参保。这个没有全国统一到“几天”的固定答案，通常要看你所在地区、材料是否齐全、系统能不能自动核验。对普通人来说，最关键不是死盯天数，而是先把信息一次填对、材料一次交齐，这样通常会快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '灵活就业人员社保参保办理后多久生效');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '灵活就业人员社保参保办理后多久生效' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '灵活就业人员社保参保多久能办好' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '灵活就业人员社保参保多久能办好');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '灵活就业人员社保参保多久生效' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '灵活就业人员社保参保多久生效');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '灵活就业人员社保参保一般要几天' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '灵活就业人员社保参保一般要几天');

-- 116. 社保 / 灵活就业人员社保参保如何查询进度
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '灵活就业人员社保参保如何查询进度', '没有单位也能按灵活就业身份参保。如果你已经提交申请，通常先在全国人社政务服务平台、属地人社经办机构或医保经办机构看有没有“我的办件”“办理进度”或查询入口。线上查不到时，再拿受理编号、身份证去窗口或打官方电话问。最有用的是把受理时间和编号先记下来，后面查起来快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '灵活就业人员社保参保如何查询进度');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '灵活就业人员社保参保如何查询进度' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '灵活就业人员社保参保进度怎么查' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '灵活就业人员社保参保进度怎么查');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '灵活就业人员社保参保审核到哪了' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '灵活就业人员社保参保审核到哪了');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么查灵活就业人员社保参保办理进度' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么查灵活就业人员社保参保办理进度');

-- 117. 社保 / 灵活就业人员社保参保需要满足什么条件
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '灵活就业人员社保参保需要满足什么条件', '没有单位也能按灵活就业身份参保。先别急着准备材料，先看自己是不是符合基本条件。大多数人办不下来，不是不会操作，而是条件没对上。最稳的办法是先在全国人社政务服务平台、属地人社经办机构或医保经办机构看适用对象、缴费要求、婚育情况或账户状态，再决定要不要申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '灵活就业人员社保参保需要满足什么条件');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '灵活就业人员社保参保需要满足什么条件' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '灵活就业人员社保参保要什么条件' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '灵活就业人员社保参保要什么条件');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '灵活就业人员社保参保申请条件是什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '灵活就业人员社保参保申请条件是什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '哪些人能办灵活就业人员社保参保' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '哪些人能办灵活就业人员社保参保');

-- 118. 社保 / 灵活就业人员社保参保能否代办
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '灵活就业人员社保参保能否代办', '没有单位也能按灵活就业身份参保。很多事项不是完全不能代办，但代办时通常要多准备委托说明、双方身份证明或其他补充材料。你最好先在全国人社政务服务平台、属地人社经办机构或医保经办机构查一下是否支持代办；如果本来就能本人线上办，通常自己操作会更快，也更不容易出错。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '灵活就业人员社保参保能否代办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '灵活就业人员社保参保能否代办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '灵活就业人员社保参保可以代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '灵活就业人员社保参保可以代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '灵活就业人员社保参保能找人代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '灵活就业人员社保参保能找人代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '灵活就业人员社保参保能委托别人办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '灵活就业人员社保参保能委托别人办吗');

-- 119. 社保 / 灵活就业人员社保参保异地可以办理吗
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '灵活就业人员社保参保异地可以办理吗', '没有单位也能按灵活就业身份参保。现在不少事项已经支持异地办或跨省通办，但不是所有地方都完全打通。最实际的做法是先在全国人社政务服务平台、属地人社经办机构或医保经办机构确认这个事项有没有异地入口；如果有就按流程在线提交，没有的话再问清楚是回原地办，还是在现居地先申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '灵活就业人员社保参保异地可以办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '灵活就业人员社保参保异地可以办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '灵活就业人员社保参保外地能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '灵活就业人员社保参保外地能办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '灵活就业人员社保参保异地怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '灵活就业人员社保参保异地怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '灵活就业人员社保参保跨省能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '灵活就业人员社保参保跨省能办吗');

-- 120. 社保 / 灵活就业人员社保参保办理失败怎么办
SET @category_id := (SELECT id FROM category WHERE name = '社保' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '灵活就业人员社保参保办理失败怎么办', '没有单位也能按灵活就业身份参保。别一被退回就重新乱提交，先看清楚退回原因。大多数情况无非是条件不符、材料不全、信息填错或系统核验不过。先把退回提示逐项改掉，再重新提交；如果提示看不懂，就直接找全国人社政务服务平台、属地人社经办机构或医保经办机构对应的官方窗口或服务热线问清楚。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '灵活就业人员社保参保办理失败怎么办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '灵活就业人员社保参保办理失败怎么办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '灵活就业人员社保参保办不下来怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '灵活就业人员社保参保办不下来怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '灵活就业人员社保参保被退回怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '灵活就业人员社保参保被退回怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '灵活就业人员社保参保申请失败怎么处理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '灵活就业人员社保参保申请失败怎么处理');

-- 121. 公积金 / 公积金账户开户如何办理
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金账户开户如何办理', '公积金开户一般分单位开户和个人账户设立两类。最方便的做法是先在北京住房公积金网、属地住房公积金管理中心或政务服务网上搜这个事项，看能不能直接线上办。能线上提交的，就按页面一步步填信息、传材料；线上办不了的，再带身份证和相关材料去窗口。先查入口再出门，通常能少跑一趟。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金账户开户如何办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金账户开户如何办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金账户开户怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金账户开户怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么办理公积金账户开户' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么办理公积金账户开户');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金账户开户去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金账户开户去哪里办');

-- 122. 公积金 / 公积金账户开户需要什么材料
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金账户开户需要什么材料', '公积金开户一般分单位开户和个人账户设立两类。一般先准备身份证，另外再按事项准备对应证明材料。很多人容易一上来准备一大堆，其实没必要，先去北京住房公积金网、属地住房公积金管理中心或政务服务网看清单最省事；能系统核验的材料通常不用重复提交，页面提示缺什么再补什么。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金账户开户需要什么材料');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金账户开户需要什么材料' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金账户开户要带什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金账户开户要带什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金账户开户要准备哪些材料' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金账户开户要准备哪些材料');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金账户开户资料有哪些' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金账户开户资料有哪些');

-- 123. 公积金 / 公积金账户开户可以网上办理吗
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金账户开户可以网上办理吗', '公积金开户一般分单位开户和个人账户设立两类。现在很多地方都支持线上办，但不是所有地区、所有情形都一样。最稳的办法是先在北京住房公积金网、属地住房公积金管理中心或政务服务网上搜索事项名称，能提交就直接线上办；如果页面提示要现场核验，再按提示去窗口，不用一开始就来回跑。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金账户开户可以网上办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金账户开户可以网上办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金账户开户能网上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金账户开户能网上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金账户开户可以线上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金账户开户可以线上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金账户开户手机上能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金账户开户手机上能办吗');

-- 124. 公积金 / 公积金账户开户在哪里办理
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金账户开户在哪里办理', '公积金开户一般分单位开户和个人账户设立两类。先别急着直接跑大厅，先在北京住房公积金网、属地住房公积金管理中心或政务服务网查办理入口、受理机构和办公时间。能线上办的直接在线提交，必须现场办的，再去属地窗口。这样做最实际，能避免跑错地方或者排队后才发现材料不对。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金账户开户在哪里办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金账户开户在哪里办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金账户开户去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金账户开户去哪里办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金账户开户在哪办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金账户开户在哪办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金账户开户在哪个窗口办理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金账户开户在哪个窗口办理');

-- 125. 公积金 / 公积金账户开户办理后多久生效
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金账户开户办理后多久生效', '公积金开户一般分单位开户和个人账户设立两类。这个没有全国统一到“几天”的固定答案，通常要看你所在地区、材料是否齐全、系统能不能自动核验。对普通人来说，最关键不是死盯天数，而是先把信息一次填对、材料一次交齐，这样通常会快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金账户开户办理后多久生效');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金账户开户办理后多久生效' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金账户开户多久能办好' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金账户开户多久能办好');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金账户开户多久生效' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金账户开户多久生效');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金账户开户一般要几天' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金账户开户一般要几天');

-- 126. 公积金 / 公积金账户开户如何查询进度
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金账户开户如何查询进度', '公积金开户一般分单位开户和个人账户设立两类。如果你已经提交申请，通常先在北京住房公积金网、属地住房公积金管理中心或政务服务网看有没有“我的办件”“办理进度”或查询入口。线上查不到时，再拿受理编号、身份证去窗口或打官方电话问。最有用的是把受理时间和编号先记下来，后面查起来快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金账户开户如何查询进度');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金账户开户如何查询进度' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金账户开户进度怎么查' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金账户开户进度怎么查');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金账户开户审核到哪了' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金账户开户审核到哪了');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么查公积金账户开户办理进度' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么查公积金账户开户办理进度');

-- 127. 公积金 / 公积金账户开户需要满足什么条件
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金账户开户需要满足什么条件', '公积金开户一般分单位开户和个人账户设立两类。先别急着准备材料，先看自己是不是符合基本条件。大多数人办不下来，不是不会操作，而是条件没对上。最稳的办法是先在北京住房公积金网、属地住房公积金管理中心或政务服务网看适用对象、缴费要求、婚育情况或账户状态，再决定要不要申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金账户开户需要满足什么条件');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金账户开户需要满足什么条件' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金账户开户要什么条件' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金账户开户要什么条件');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金账户开户申请条件是什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金账户开户申请条件是什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '哪些人能办公积金账户开户' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '哪些人能办公积金账户开户');

-- 128. 公积金 / 公积金账户开户能否代办
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金账户开户能否代办', '公积金开户一般分单位开户和个人账户设立两类。很多事项不是完全不能代办，但代办时通常要多准备委托说明、双方身份证明或其他补充材料。你最好先在北京住房公积金网、属地住房公积金管理中心或政务服务网查一下是否支持代办；如果本来就能本人线上办，通常自己操作会更快，也更不容易出错。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金账户开户能否代办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金账户开户能否代办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金账户开户可以代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金账户开户可以代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金账户开户能找人代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金账户开户能找人代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金账户开户能委托别人办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金账户开户能委托别人办吗');

-- 129. 公积金 / 公积金账户开户异地可以办理吗
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金账户开户异地可以办理吗', '公积金开户一般分单位开户和个人账户设立两类。现在不少事项已经支持异地办或跨省通办，但不是所有地方都完全打通。最实际的做法是先在北京住房公积金网、属地住房公积金管理中心或政务服务网确认这个事项有没有异地入口；如果有就按流程在线提交，没有的话再问清楚是回原地办，还是在现居地先申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金账户开户异地可以办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金账户开户异地可以办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金账户开户外地能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金账户开户外地能办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金账户开户异地怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金账户开户异地怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金账户开户跨省能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金账户开户跨省能办吗');

-- 130. 公积金 / 公积金账户开户办理失败怎么办
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金账户开户办理失败怎么办', '公积金开户一般分单位开户和个人账户设立两类。别一被退回就重新乱提交，先看清楚退回原因。大多数情况无非是条件不符、材料不全、信息填错或系统核验不过。先把退回提示逐项改掉，再重新提交；如果提示看不懂，就直接找北京住房公积金网、属地住房公积金管理中心或政务服务网对应的官方窗口或服务热线问清楚。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金账户开户办理失败怎么办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金账户开户办理失败怎么办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金账户开户办不下来怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金账户开户办不下来怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金账户开户被退回怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金账户开户被退回怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金账户开户申请失败怎么处理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金账户开户申请失败怎么处理');

-- 131. 公积金 / 公积金缴存如何办理
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金缴存如何办理', '公积金缴存最常见的问题是单位有没有按时、按基数正常缴。最方便的做法是先在北京住房公积金网、属地住房公积金管理中心或政务服务网上搜这个事项，看能不能直接线上办。能线上提交的，就按页面一步步填信息、传材料；线上办不了的，再带身份证和相关材料去窗口。先查入口再出门，通常能少跑一趟。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金缴存如何办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金缴存如何办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金缴存怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金缴存怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么办理公积金缴存' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么办理公积金缴存');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金缴存去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金缴存去哪里办');

-- 132. 公积金 / 公积金缴存需要什么材料
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金缴存需要什么材料', '公积金缴存最常见的问题是单位有没有按时、按基数正常缴。一般先准备身份证，另外再按事项准备对应证明材料。很多人容易一上来准备一大堆，其实没必要，先去北京住房公积金网、属地住房公积金管理中心或政务服务网看清单最省事；能系统核验的材料通常不用重复提交，页面提示缺什么再补什么。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金缴存需要什么材料');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金缴存需要什么材料' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金缴存要带什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金缴存要带什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金缴存要准备哪些材料' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金缴存要准备哪些材料');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金缴存资料有哪些' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金缴存资料有哪些');

-- 133. 公积金 / 公积金缴存可以网上办理吗
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金缴存可以网上办理吗', '公积金缴存最常见的问题是单位有没有按时、按基数正常缴。现在很多地方都支持线上办，但不是所有地区、所有情形都一样。最稳的办法是先在北京住房公积金网、属地住房公积金管理中心或政务服务网上搜索事项名称，能提交就直接线上办；如果页面提示要现场核验，再按提示去窗口，不用一开始就来回跑。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金缴存可以网上办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金缴存可以网上办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金缴存能网上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金缴存能网上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金缴存可以线上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金缴存可以线上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金缴存手机上能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金缴存手机上能办吗');

-- 134. 公积金 / 公积金缴存在哪里办理
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金缴存在哪里办理', '公积金缴存最常见的问题是单位有没有按时、按基数正常缴。先别急着直接跑大厅，先在北京住房公积金网、属地住房公积金管理中心或政务服务网查办理入口、受理机构和办公时间。能线上办的直接在线提交，必须现场办的，再去属地窗口。这样做最实际，能避免跑错地方或者排队后才发现材料不对。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金缴存在哪里办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金缴存在哪里办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金缴存去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金缴存去哪里办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金缴存在哪办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金缴存在哪办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金缴存在哪个窗口办理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金缴存在哪个窗口办理');

-- 135. 公积金 / 公积金缴存办理后多久生效
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金缴存办理后多久生效', '公积金缴存最常见的问题是单位有没有按时、按基数正常缴。这个没有全国统一到“几天”的固定答案，通常要看你所在地区、材料是否齐全、系统能不能自动核验。对普通人来说，最关键不是死盯天数，而是先把信息一次填对、材料一次交齐，这样通常会快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金缴存办理后多久生效');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金缴存办理后多久生效' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金缴存多久能办好' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金缴存多久能办好');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金缴存多久生效' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金缴存多久生效');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金缴存一般要几天' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金缴存一般要几天');

-- 136. 公积金 / 公积金缴存如何查询进度
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金缴存如何查询进度', '公积金缴存最常见的问题是单位有没有按时、按基数正常缴。如果你已经提交申请，通常先在北京住房公积金网、属地住房公积金管理中心或政务服务网看有没有“我的办件”“办理进度”或查询入口。线上查不到时，再拿受理编号、身份证去窗口或打官方电话问。最有用的是把受理时间和编号先记下来，后面查起来快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金缴存如何查询进度');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金缴存如何查询进度' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金缴存进度怎么查' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金缴存进度怎么查');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金缴存审核到哪了' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金缴存审核到哪了');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么查公积金缴存办理进度' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么查公积金缴存办理进度');

-- 137. 公积金 / 公积金缴存需要满足什么条件
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金缴存需要满足什么条件', '公积金缴存最常见的问题是单位有没有按时、按基数正常缴。先别急着准备材料，先看自己是不是符合基本条件。大多数人办不下来，不是不会操作，而是条件没对上。最稳的办法是先在北京住房公积金网、属地住房公积金管理中心或政务服务网看适用对象、缴费要求、婚育情况或账户状态，再决定要不要申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金缴存需要满足什么条件');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金缴存需要满足什么条件' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金缴存要什么条件' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金缴存要什么条件');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金缴存申请条件是什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金缴存申请条件是什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '哪些人能办公积金缴存' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '哪些人能办公积金缴存');

-- 138. 公积金 / 公积金缴存能否代办
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金缴存能否代办', '公积金缴存最常见的问题是单位有没有按时、按基数正常缴。很多事项不是完全不能代办，但代办时通常要多准备委托说明、双方身份证明或其他补充材料。你最好先在北京住房公积金网、属地住房公积金管理中心或政务服务网查一下是否支持代办；如果本来就能本人线上办，通常自己操作会更快，也更不容易出错。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金缴存能否代办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金缴存能否代办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金缴存可以代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金缴存可以代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金缴存能找人代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金缴存能找人代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金缴存能委托别人办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金缴存能委托别人办吗');

-- 139. 公积金 / 公积金缴存异地可以办理吗
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金缴存异地可以办理吗', '公积金缴存最常见的问题是单位有没有按时、按基数正常缴。现在不少事项已经支持异地办或跨省通办，但不是所有地方都完全打通。最实际的做法是先在北京住房公积金网、属地住房公积金管理中心或政务服务网确认这个事项有没有异地入口；如果有就按流程在线提交，没有的话再问清楚是回原地办，还是在现居地先申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金缴存异地可以办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金缴存异地可以办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金缴存外地能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金缴存外地能办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金缴存异地怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金缴存异地怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金缴存跨省能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金缴存跨省能办吗');

-- 140. 公积金 / 公积金缴存办理失败怎么办
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金缴存办理失败怎么办', '公积金缴存最常见的问题是单位有没有按时、按基数正常缴。别一被退回就重新乱提交，先看清楚退回原因。大多数情况无非是条件不符、材料不全、信息填错或系统核验不过。先把退回提示逐项改掉，再重新提交；如果提示看不懂，就直接找北京住房公积金网、属地住房公积金管理中心或政务服务网对应的官方窗口或服务热线问清楚。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金缴存办理失败怎么办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金缴存办理失败怎么办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金缴存办不下来怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金缴存办不下来怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金缴存被退回怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金缴存被退回怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金缴存申请失败怎么处理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金缴存申请失败怎么处理');

-- 141. 公积金 / 公积金账户查询如何办理
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金账户查询如何办理', '查公积金账户一般不用跑窗口，线上就能先看。最方便的做法是先在北京住房公积金网、北京公积金APP、属地公积金中心官网或服务网点上搜这个事项，看能不能直接线上办。能线上提交的，就按页面一步步填信息、传材料；线上办不了的，再带身份证和相关材料去窗口。先查入口再出门，通常能少跑一趟。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金账户查询如何办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金账户查询如何办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金账户查询怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金账户查询怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么办理公积金账户查询' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么办理公积金账户查询');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金账户查询去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金账户查询去哪里办');

-- 142. 公积金 / 公积金账户查询需要什么材料
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金账户查询需要什么材料', '查公积金账户一般不用跑窗口，线上就能先看。一般先准备身份证，另外再按事项准备对应证明材料。很多人容易一上来准备一大堆，其实没必要，先去北京住房公积金网、北京公积金APP、属地公积金中心官网或服务网点看清单最省事；能系统核验的材料通常不用重复提交，页面提示缺什么再补什么。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金账户查询需要什么材料');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金账户查询需要什么材料' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金账户查询要带什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金账户查询要带什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金账户查询要准备哪些材料' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金账户查询要准备哪些材料');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金账户查询资料有哪些' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金账户查询资料有哪些');

-- 143. 公积金 / 公积金账户查询可以网上办理吗
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金账户查询可以网上办理吗', '查公积金账户一般不用跑窗口，线上就能先看。现在很多地方都支持线上办，但不是所有地区、所有情形都一样。最稳的办法是先在北京住房公积金网、北京公积金APP、属地公积金中心官网或服务网点上搜索事项名称，能提交就直接线上办；如果页面提示要现场核验，再按提示去窗口，不用一开始就来回跑。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金账户查询可以网上办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金账户查询可以网上办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金账户查询能网上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金账户查询能网上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金账户查询可以线上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金账户查询可以线上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金账户查询手机上能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金账户查询手机上能办吗');

-- 144. 公积金 / 公积金账户查询在哪里办理
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金账户查询在哪里办理', '查公积金账户一般不用跑窗口，线上就能先看。先别急着直接跑大厅，先在北京住房公积金网、北京公积金APP、属地公积金中心官网或服务网点查办理入口、受理机构和办公时间。能线上办的直接在线提交，必须现场办的，再去属地窗口。这样做最实际，能避免跑错地方或者排队后才发现材料不对。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金账户查询在哪里办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金账户查询在哪里办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金账户查询去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金账户查询去哪里办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金账户查询在哪办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金账户查询在哪办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金账户查询在哪个窗口办理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金账户查询在哪个窗口办理');

-- 145. 公积金 / 公积金账户查询办理后多久生效
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金账户查询办理后多久生效', '查公积金账户一般不用跑窗口，线上就能先看。这个没有全国统一到“几天”的固定答案，通常要看你所在地区、材料是否齐全、系统能不能自动核验。对普通人来说，最关键不是死盯天数，而是先把信息一次填对、材料一次交齐，这样通常会快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金账户查询办理后多久生效');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金账户查询办理后多久生效' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金账户查询多久能办好' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金账户查询多久能办好');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金账户查询多久生效' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金账户查询多久生效');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金账户查询一般要几天' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金账户查询一般要几天');

-- 146. 公积金 / 公积金账户查询如何查询进度
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金账户查询如何查询进度', '查公积金账户一般不用跑窗口，线上就能先看。如果你已经提交申请，通常先在北京住房公积金网、北京公积金APP、属地公积金中心官网或服务网点看有没有“我的办件”“办理进度”或查询入口。线上查不到时，再拿受理编号、身份证去窗口或打官方电话问。最有用的是把受理时间和编号先记下来，后面查起来快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金账户查询如何查询进度');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金账户查询如何查询进度' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金账户查询进度怎么查' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金账户查询进度怎么查');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金账户查询审核到哪了' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金账户查询审核到哪了');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么查公积金账户查询办理进度' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么查公积金账户查询办理进度');

-- 147. 公积金 / 公积金账户查询需要满足什么条件
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金账户查询需要满足什么条件', '查公积金账户一般不用跑窗口，线上就能先看。先别急着准备材料，先看自己是不是符合基本条件。大多数人办不下来，不是不会操作，而是条件没对上。最稳的办法是先在北京住房公积金网、北京公积金APP、属地公积金中心官网或服务网点看适用对象、缴费要求、婚育情况或账户状态，再决定要不要申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金账户查询需要满足什么条件');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金账户查询需要满足什么条件' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金账户查询要什么条件' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金账户查询要什么条件');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金账户查询申请条件是什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金账户查询申请条件是什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '哪些人能办公积金账户查询' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '哪些人能办公积金账户查询');

-- 148. 公积金 / 公积金账户查询能否代办
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金账户查询能否代办', '查公积金账户一般不用跑窗口，线上就能先看。很多事项不是完全不能代办，但代办时通常要多准备委托说明、双方身份证明或其他补充材料。你最好先在北京住房公积金网、北京公积金APP、属地公积金中心官网或服务网点查一下是否支持代办；如果本来就能本人线上办，通常自己操作会更快，也更不容易出错。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金账户查询能否代办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金账户查询能否代办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金账户查询可以代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金账户查询可以代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金账户查询能找人代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金账户查询能找人代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金账户查询能委托别人办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金账户查询能委托别人办吗');

-- 149. 公积金 / 公积金账户查询异地可以办理吗
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金账户查询异地可以办理吗', '查公积金账户一般不用跑窗口，线上就能先看。现在不少事项已经支持异地办或跨省通办，但不是所有地方都完全打通。最实际的做法是先在北京住房公积金网、北京公积金APP、属地公积金中心官网或服务网点确认这个事项有没有异地入口；如果有就按流程在线提交，没有的话再问清楚是回原地办，还是在现居地先申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金账户查询异地可以办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金账户查询异地可以办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金账户查询外地能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金账户查询外地能办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金账户查询异地怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金账户查询异地怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金账户查询跨省能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金账户查询跨省能办吗');

-- 150. 公积金 / 公积金账户查询办理失败怎么办
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金账户查询办理失败怎么办', '查公积金账户一般不用跑窗口，线上就能先看。别一被退回就重新乱提交，先看清楚退回原因。大多数情况无非是条件不符、材料不全、信息填错或系统核验不过。先把退回提示逐项改掉，再重新提交；如果提示看不懂，就直接找北京住房公积金网、北京公积金APP、属地公积金中心官网或服务网点对应的官方窗口或服务热线问清楚。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金账户查询办理失败怎么办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金账户查询办理失败怎么办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金账户查询办不下来怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金账户查询办不下来怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金账户查询被退回怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金账户查询被退回怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金账户查询申请失败怎么处理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金账户查询申请失败怎么处理');

-- 151. 公积金 / 购房提取公积金如何办理
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '购房提取公积金如何办理', '买房后能不能提取公积金，先看你属于哪种购房情形。最方便的做法是先在北京住房公积金网、属地住房公积金管理中心或政务服务网上搜这个事项，看能不能直接线上办。能线上提交的，就按页面一步步填信息、传材料；线上办不了的，再带身份证和相关材料去窗口。先查入口再出门，通常能少跑一趟。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '购房提取公积金如何办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '购房提取公积金如何办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '购房提取公积金怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '购房提取公积金怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么办理购房提取公积金' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么办理购房提取公积金');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '购房提取公积金去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '购房提取公积金去哪里办');

-- 152. 公积金 / 购房提取公积金需要什么材料
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '购房提取公积金需要什么材料', '买房后能不能提取公积金，先看你属于哪种购房情形。一般先准备身份证，另外再按事项准备对应证明材料。很多人容易一上来准备一大堆，其实没必要，先去北京住房公积金网、属地住房公积金管理中心或政务服务网看清单最省事；能系统核验的材料通常不用重复提交，页面提示缺什么再补什么。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '购房提取公积金需要什么材料');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '购房提取公积金需要什么材料' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '购房提取公积金要带什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '购房提取公积金要带什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '购房提取公积金要准备哪些材料' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '购房提取公积金要准备哪些材料');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '购房提取公积金资料有哪些' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '购房提取公积金资料有哪些');

-- 153. 公积金 / 购房提取公积金可以网上办理吗
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '购房提取公积金可以网上办理吗', '买房后能不能提取公积金，先看你属于哪种购房情形。现在很多地方都支持线上办，但不是所有地区、所有情形都一样。最稳的办法是先在北京住房公积金网、属地住房公积金管理中心或政务服务网上搜索事项名称，能提交就直接线上办；如果页面提示要现场核验，再按提示去窗口，不用一开始就来回跑。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '购房提取公积金可以网上办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '购房提取公积金可以网上办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '购房提取公积金能网上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '购房提取公积金能网上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '购房提取公积金可以线上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '购房提取公积金可以线上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '购房提取公积金手机上能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '购房提取公积金手机上能办吗');

-- 154. 公积金 / 购房提取公积金在哪里办理
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '购房提取公积金在哪里办理', '买房后能不能提取公积金，先看你属于哪种购房情形。先别急着直接跑大厅，先在北京住房公积金网、属地住房公积金管理中心或政务服务网查办理入口、受理机构和办公时间。能线上办的直接在线提交，必须现场办的，再去属地窗口。这样做最实际，能避免跑错地方或者排队后才发现材料不对。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '购房提取公积金在哪里办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '购房提取公积金在哪里办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '购房提取公积金去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '购房提取公积金去哪里办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '购房提取公积金在哪办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '购房提取公积金在哪办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '购房提取公积金在哪个窗口办理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '购房提取公积金在哪个窗口办理');

-- 155. 公积金 / 购房提取公积金办理后多久生效
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '购房提取公积金办理后多久生效', '买房后能不能提取公积金，先看你属于哪种购房情形。这个没有全国统一到“几天”的固定答案，通常要看你所在地区、材料是否齐全、系统能不能自动核验。对普通人来说，最关键不是死盯天数，而是先把信息一次填对、材料一次交齐，这样通常会快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '购房提取公积金办理后多久生效');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '购房提取公积金办理后多久生效' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '购房提取公积金多久能办好' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '购房提取公积金多久能办好');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '购房提取公积金多久生效' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '购房提取公积金多久生效');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '购房提取公积金一般要几天' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '购房提取公积金一般要几天');

-- 156. 公积金 / 购房提取公积金如何查询进度
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '购房提取公积金如何查询进度', '买房后能不能提取公积金，先看你属于哪种购房情形。如果你已经提交申请，通常先在北京住房公积金网、属地住房公积金管理中心或政务服务网看有没有“我的办件”“办理进度”或查询入口。线上查不到时，再拿受理编号、身份证去窗口或打官方电话问。最有用的是把受理时间和编号先记下来，后面查起来快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '购房提取公积金如何查询进度');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '购房提取公积金如何查询进度' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '购房提取公积金进度怎么查' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '购房提取公积金进度怎么查');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '购房提取公积金审核到哪了' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '购房提取公积金审核到哪了');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么查购房提取公积金办理进度' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么查购房提取公积金办理进度');

-- 157. 公积金 / 购房提取公积金需要满足什么条件
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '购房提取公积金需要满足什么条件', '买房后能不能提取公积金，先看你属于哪种购房情形。先别急着准备材料，先看自己是不是符合基本条件。大多数人办不下来，不是不会操作，而是条件没对上。最稳的办法是先在北京住房公积金网、属地住房公积金管理中心或政务服务网看适用对象、缴费要求、婚育情况或账户状态，再决定要不要申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '购房提取公积金需要满足什么条件');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '购房提取公积金需要满足什么条件' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '购房提取公积金要什么条件' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '购房提取公积金要什么条件');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '购房提取公积金申请条件是什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '购房提取公积金申请条件是什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '哪些人能办购房提取公积金' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '哪些人能办购房提取公积金');

-- 158. 公积金 / 购房提取公积金能否代办
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '购房提取公积金能否代办', '买房后能不能提取公积金，先看你属于哪种购房情形。很多事项不是完全不能代办，但代办时通常要多准备委托说明、双方身份证明或其他补充材料。你最好先在北京住房公积金网、属地住房公积金管理中心或政务服务网查一下是否支持代办；如果本来就能本人线上办，通常自己操作会更快，也更不容易出错。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '购房提取公积金能否代办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '购房提取公积金能否代办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '购房提取公积金可以代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '购房提取公积金可以代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '购房提取公积金能找人代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '购房提取公积金能找人代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '购房提取公积金能委托别人办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '购房提取公积金能委托别人办吗');

-- 159. 公积金 / 购房提取公积金异地可以办理吗
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '购房提取公积金异地可以办理吗', '买房后能不能提取公积金，先看你属于哪种购房情形。现在不少事项已经支持异地办或跨省通办，但不是所有地方都完全打通。最实际的做法是先在北京住房公积金网、属地住房公积金管理中心或政务服务网确认这个事项有没有异地入口；如果有就按流程在线提交，没有的话再问清楚是回原地办，还是在现居地先申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '购房提取公积金异地可以办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '购房提取公积金异地可以办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '购房提取公积金外地能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '购房提取公积金外地能办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '购房提取公积金异地怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '购房提取公积金异地怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '购房提取公积金跨省能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '购房提取公积金跨省能办吗');

-- 160. 公积金 / 购房提取公积金办理失败怎么办
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '购房提取公积金办理失败怎么办', '买房后能不能提取公积金，先看你属于哪种购房情形。别一被退回就重新乱提交，先看清楚退回原因。大多数情况无非是条件不符、材料不全、信息填错或系统核验不过。先把退回提示逐项改掉，再重新提交；如果提示看不懂，就直接找北京住房公积金网、属地住房公积金管理中心或政务服务网对应的官方窗口或服务热线问清楚。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '购房提取公积金办理失败怎么办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '购房提取公积金办理失败怎么办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '购房提取公积金办不下来怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '购房提取公积金办不下来怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '购房提取公积金被退回怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '购房提取公积金被退回怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '购房提取公积金申请失败怎么处理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '购房提取公积金申请失败怎么处理');

-- 161. 公积金 / 租房提取公积金如何办理
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '租房提取公积金如何办理', '租房提取是公积金里最常见的高频事项之一。最方便的做法是先在北京住房公积金网、属地住房公积金管理中心或政务服务网上搜这个事项，看能不能直接线上办。能线上提交的，就按页面一步步填信息、传材料；线上办不了的，再带身份证和相关材料去窗口。先查入口再出门，通常能少跑一趟。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '租房提取公积金如何办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '租房提取公积金如何办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '租房提取公积金怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '租房提取公积金怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么办理租房提取公积金' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么办理租房提取公积金');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '租房提取公积金去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '租房提取公积金去哪里办');

-- 162. 公积金 / 租房提取公积金需要什么材料
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '租房提取公积金需要什么材料', '租房提取是公积金里最常见的高频事项之一。一般先准备身份证，另外再按事项准备对应证明材料。很多人容易一上来准备一大堆，其实没必要，先去北京住房公积金网、属地住房公积金管理中心或政务服务网看清单最省事；能系统核验的材料通常不用重复提交，页面提示缺什么再补什么。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '租房提取公积金需要什么材料');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '租房提取公积金需要什么材料' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '租房提取公积金要带什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '租房提取公积金要带什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '租房提取公积金要准备哪些材料' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '租房提取公积金要准备哪些材料');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '租房提取公积金资料有哪些' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '租房提取公积金资料有哪些');

-- 163. 公积金 / 租房提取公积金可以网上办理吗
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '租房提取公积金可以网上办理吗', '租房提取是公积金里最常见的高频事项之一。现在很多地方都支持线上办，但不是所有地区、所有情形都一样。最稳的办法是先在北京住房公积金网、属地住房公积金管理中心或政务服务网上搜索事项名称，能提交就直接线上办；如果页面提示要现场核验，再按提示去窗口，不用一开始就来回跑。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '租房提取公积金可以网上办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '租房提取公积金可以网上办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '租房提取公积金能网上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '租房提取公积金能网上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '租房提取公积金可以线上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '租房提取公积金可以线上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '租房提取公积金手机上能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '租房提取公积金手机上能办吗');

-- 164. 公积金 / 租房提取公积金在哪里办理
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '租房提取公积金在哪里办理', '租房提取是公积金里最常见的高频事项之一。先别急着直接跑大厅，先在北京住房公积金网、属地住房公积金管理中心或政务服务网查办理入口、受理机构和办公时间。能线上办的直接在线提交，必须现场办的，再去属地窗口。这样做最实际，能避免跑错地方或者排队后才发现材料不对。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '租房提取公积金在哪里办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '租房提取公积金在哪里办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '租房提取公积金去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '租房提取公积金去哪里办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '租房提取公积金在哪办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '租房提取公积金在哪办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '租房提取公积金在哪个窗口办理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '租房提取公积金在哪个窗口办理');

-- 165. 公积金 / 租房提取公积金办理后多久生效
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '租房提取公积金办理后多久生效', '租房提取是公积金里最常见的高频事项之一。这个没有全国统一到“几天”的固定答案，通常要看你所在地区、材料是否齐全、系统能不能自动核验。对普通人来说，最关键不是死盯天数，而是先把信息一次填对、材料一次交齐，这样通常会快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '租房提取公积金办理后多久生效');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '租房提取公积金办理后多久生效' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '租房提取公积金多久能办好' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '租房提取公积金多久能办好');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '租房提取公积金多久生效' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '租房提取公积金多久生效');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '租房提取公积金一般要几天' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '租房提取公积金一般要几天');

-- 166. 公积金 / 租房提取公积金如何查询进度
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '租房提取公积金如何查询进度', '租房提取是公积金里最常见的高频事项之一。如果你已经提交申请，通常先在北京住房公积金网、属地住房公积金管理中心或政务服务网看有没有“我的办件”“办理进度”或查询入口。线上查不到时，再拿受理编号、身份证去窗口或打官方电话问。最有用的是把受理时间和编号先记下来，后面查起来快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '租房提取公积金如何查询进度');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '租房提取公积金如何查询进度' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '租房提取公积金进度怎么查' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '租房提取公积金进度怎么查');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '租房提取公积金审核到哪了' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '租房提取公积金审核到哪了');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么查租房提取公积金办理进度' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么查租房提取公积金办理进度');

-- 167. 公积金 / 租房提取公积金需要满足什么条件
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '租房提取公积金需要满足什么条件', '租房提取是公积金里最常见的高频事项之一。先别急着准备材料，先看自己是不是符合基本条件。大多数人办不下来，不是不会操作，而是条件没对上。最稳的办法是先在北京住房公积金网、属地住房公积金管理中心或政务服务网看适用对象、缴费要求、婚育情况或账户状态，再决定要不要申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '租房提取公积金需要满足什么条件');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '租房提取公积金需要满足什么条件' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '租房提取公积金要什么条件' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '租房提取公积金要什么条件');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '租房提取公积金申请条件是什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '租房提取公积金申请条件是什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '哪些人能办租房提取公积金' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '哪些人能办租房提取公积金');

-- 168. 公积金 / 租房提取公积金能否代办
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '租房提取公积金能否代办', '租房提取是公积金里最常见的高频事项之一。很多事项不是完全不能代办，但代办时通常要多准备委托说明、双方身份证明或其他补充材料。你最好先在北京住房公积金网、属地住房公积金管理中心或政务服务网查一下是否支持代办；如果本来就能本人线上办，通常自己操作会更快，也更不容易出错。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '租房提取公积金能否代办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '租房提取公积金能否代办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '租房提取公积金可以代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '租房提取公积金可以代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '租房提取公积金能找人代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '租房提取公积金能找人代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '租房提取公积金能委托别人办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '租房提取公积金能委托别人办吗');

-- 169. 公积金 / 租房提取公积金异地可以办理吗
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '租房提取公积金异地可以办理吗', '租房提取是公积金里最常见的高频事项之一。现在不少事项已经支持异地办或跨省通办，但不是所有地方都完全打通。最实际的做法是先在北京住房公积金网、属地住房公积金管理中心或政务服务网确认这个事项有没有异地入口；如果有就按流程在线提交，没有的话再问清楚是回原地办，还是在现居地先申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '租房提取公积金异地可以办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '租房提取公积金异地可以办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '租房提取公积金外地能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '租房提取公积金外地能办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '租房提取公积金异地怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '租房提取公积金异地怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '租房提取公积金跨省能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '租房提取公积金跨省能办吗');

-- 170. 公积金 / 租房提取公积金办理失败怎么办
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '租房提取公积金办理失败怎么办', '租房提取是公积金里最常见的高频事项之一。别一被退回就重新乱提交，先看清楚退回原因。大多数情况无非是条件不符、材料不全、信息填错或系统核验不过。先把退回提示逐项改掉，再重新提交；如果提示看不懂，就直接找北京住房公积金网、属地住房公积金管理中心或政务服务网对应的官方窗口或服务热线问清楚。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '租房提取公积金办理失败怎么办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '租房提取公积金办理失败怎么办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '租房提取公积金办不下来怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '租房提取公积金办不下来怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '租房提取公积金被退回怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '租房提取公积金被退回怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '租房提取公积金申请失败怎么处理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '租房提取公积金申请失败怎么处理');

-- 171. 公积金 / 离职退休提取公积金如何办理
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '离职退休提取公积金如何办理', '离职、退休、封存等情形下能不能提取，要先看账户状态和当地规则。最方便的做法是先在北京住房公积金网、属地住房公积金管理中心或政务服务网上搜这个事项，看能不能直接线上办。能线上提交的，就按页面一步步填信息、传材料；线上办不了的，再带身份证和相关材料去窗口。先查入口再出门，通常能少跑一趟。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '离职退休提取公积金如何办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '离职退休提取公积金如何办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '离职退休提取公积金怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '离职退休提取公积金怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么办理离职退休提取公积金' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么办理离职退休提取公积金');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '离职退休提取公积金去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '离职退休提取公积金去哪里办');

-- 172. 公积金 / 离职退休提取公积金需要什么材料
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '离职退休提取公积金需要什么材料', '离职、退休、封存等情形下能不能提取，要先看账户状态和当地规则。一般先准备身份证，另外再按事项准备对应证明材料。很多人容易一上来准备一大堆，其实没必要，先去北京住房公积金网、属地住房公积金管理中心或政务服务网看清单最省事；能系统核验的材料通常不用重复提交，页面提示缺什么再补什么。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '离职退休提取公积金需要什么材料');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '离职退休提取公积金需要什么材料' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '离职退休提取公积金要带什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '离职退休提取公积金要带什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '离职退休提取公积金要准备哪些材料' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '离职退休提取公积金要准备哪些材料');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '离职退休提取公积金资料有哪些' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '离职退休提取公积金资料有哪些');

-- 173. 公积金 / 离职退休提取公积金可以网上办理吗
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '离职退休提取公积金可以网上办理吗', '离职、退休、封存等情形下能不能提取，要先看账户状态和当地规则。现在很多地方都支持线上办，但不是所有地区、所有情形都一样。最稳的办法是先在北京住房公积金网、属地住房公积金管理中心或政务服务网上搜索事项名称，能提交就直接线上办；如果页面提示要现场核验，再按提示去窗口，不用一开始就来回跑。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '离职退休提取公积金可以网上办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '离职退休提取公积金可以网上办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '离职退休提取公积金能网上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '离职退休提取公积金能网上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '离职退休提取公积金可以线上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '离职退休提取公积金可以线上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '离职退休提取公积金手机上能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '离职退休提取公积金手机上能办吗');

-- 174. 公积金 / 离职退休提取公积金在哪里办理
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '离职退休提取公积金在哪里办理', '离职、退休、封存等情形下能不能提取，要先看账户状态和当地规则。先别急着直接跑大厅，先在北京住房公积金网、属地住房公积金管理中心或政务服务网查办理入口、受理机构和办公时间。能线上办的直接在线提交，必须现场办的，再去属地窗口。这样做最实际，能避免跑错地方或者排队后才发现材料不对。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '离职退休提取公积金在哪里办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '离职退休提取公积金在哪里办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '离职退休提取公积金去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '离职退休提取公积金去哪里办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '离职退休提取公积金在哪办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '离职退休提取公积金在哪办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '离职退休提取公积金在哪个窗口办理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '离职退休提取公积金在哪个窗口办理');

-- 175. 公积金 / 离职退休提取公积金办理后多久生效
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '离职退休提取公积金办理后多久生效', '离职、退休、封存等情形下能不能提取，要先看账户状态和当地规则。这个没有全国统一到“几天”的固定答案，通常要看你所在地区、材料是否齐全、系统能不能自动核验。对普通人来说，最关键不是死盯天数，而是先把信息一次填对、材料一次交齐，这样通常会快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '离职退休提取公积金办理后多久生效');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '离职退休提取公积金办理后多久生效' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '离职退休提取公积金多久能办好' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '离职退休提取公积金多久能办好');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '离职退休提取公积金多久生效' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '离职退休提取公积金多久生效');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '离职退休提取公积金一般要几天' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '离职退休提取公积金一般要几天');

-- 176. 公积金 / 离职退休提取公积金如何查询进度
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '离职退休提取公积金如何查询进度', '离职、退休、封存等情形下能不能提取，要先看账户状态和当地规则。如果你已经提交申请，通常先在北京住房公积金网、属地住房公积金管理中心或政务服务网看有没有“我的办件”“办理进度”或查询入口。线上查不到时，再拿受理编号、身份证去窗口或打官方电话问。最有用的是把受理时间和编号先记下来，后面查起来快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '离职退休提取公积金如何查询进度');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '离职退休提取公积金如何查询进度' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '离职退休提取公积金进度怎么查' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '离职退休提取公积金进度怎么查');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '离职退休提取公积金审核到哪了' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '离职退休提取公积金审核到哪了');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么查离职退休提取公积金办理进度' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么查离职退休提取公积金办理进度');

-- 177. 公积金 / 离职退休提取公积金需要满足什么条件
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '离职退休提取公积金需要满足什么条件', '离职、退休、封存等情形下能不能提取，要先看账户状态和当地规则。先别急着准备材料，先看自己是不是符合基本条件。大多数人办不下来，不是不会操作，而是条件没对上。最稳的办法是先在北京住房公积金网、属地住房公积金管理中心或政务服务网看适用对象、缴费要求、婚育情况或账户状态，再决定要不要申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '离职退休提取公积金需要满足什么条件');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '离职退休提取公积金需要满足什么条件' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '离职退休提取公积金要什么条件' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '离职退休提取公积金要什么条件');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '离职退休提取公积金申请条件是什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '离职退休提取公积金申请条件是什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '哪些人能办离职退休提取公积金' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '哪些人能办离职退休提取公积金');

-- 178. 公积金 / 离职退休提取公积金能否代办
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '离职退休提取公积金能否代办', '离职、退休、封存等情形下能不能提取，要先看账户状态和当地规则。很多事项不是完全不能代办，但代办时通常要多准备委托说明、双方身份证明或其他补充材料。你最好先在北京住房公积金网、属地住房公积金管理中心或政务服务网查一下是否支持代办；如果本来就能本人线上办，通常自己操作会更快，也更不容易出错。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '离职退休提取公积金能否代办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '离职退休提取公积金能否代办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '离职退休提取公积金可以代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '离职退休提取公积金可以代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '离职退休提取公积金能找人代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '离职退休提取公积金能找人代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '离职退休提取公积金能委托别人办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '离职退休提取公积金能委托别人办吗');

-- 179. 公积金 / 离职退休提取公积金异地可以办理吗
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '离职退休提取公积金异地可以办理吗', '离职、退休、封存等情形下能不能提取，要先看账户状态和当地规则。现在不少事项已经支持异地办或跨省通办，但不是所有地方都完全打通。最实际的做法是先在北京住房公积金网、属地住房公积金管理中心或政务服务网确认这个事项有没有异地入口；如果有就按流程在线提交，没有的话再问清楚是回原地办，还是在现居地先申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '离职退休提取公积金异地可以办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '离职退休提取公积金异地可以办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '离职退休提取公积金外地能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '离职退休提取公积金外地能办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '离职退休提取公积金异地怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '离职退休提取公积金异地怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '离职退休提取公积金跨省能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '离职退休提取公积金跨省能办吗');

-- 180. 公积金 / 离职退休提取公积金办理失败怎么办
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '离职退休提取公积金办理失败怎么办', '离职、退休、封存等情形下能不能提取，要先看账户状态和当地规则。别一被退回就重新乱提交，先看清楚退回原因。大多数情况无非是条件不符、材料不全、信息填错或系统核验不过。先把退回提示逐项改掉，再重新提交；如果提示看不懂，就直接找北京住房公积金网、属地住房公积金管理中心或政务服务网对应的官方窗口或服务热线问清楚。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '离职退休提取公积金办理失败怎么办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '离职退休提取公积金办理失败怎么办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '离职退休提取公积金办不下来怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '离职退休提取公积金办不下来怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '离职退休提取公积金被退回怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '离职退休提取公积金被退回怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '离职退休提取公积金申请失败怎么处理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '离职退休提取公积金申请失败怎么处理');

-- 181. 公积金 / 公积金贷款申请如何办理
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金贷款申请如何办理', '公积金贷款别等到签合同后才去问资格，最好提前查。最方便的做法是先在北京住房公积金网、属地住房公积金管理中心或政务服务网上搜这个事项，看能不能直接线上办。能线上提交的，就按页面一步步填信息、传材料；线上办不了的，再带身份证和相关材料去窗口。先查入口再出门，通常能少跑一趟。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款申请如何办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款申请如何办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款申请怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款申请怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么办理公积金贷款申请' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么办理公积金贷款申请');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款申请去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款申请去哪里办');

-- 182. 公积金 / 公积金贷款申请需要什么材料
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金贷款申请需要什么材料', '公积金贷款别等到签合同后才去问资格，最好提前查。一般先准备身份证，另外再按事项准备对应证明材料。很多人容易一上来准备一大堆，其实没必要，先去北京住房公积金网、属地住房公积金管理中心或政务服务网看清单最省事；能系统核验的材料通常不用重复提交，页面提示缺什么再补什么。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款申请需要什么材料');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款申请需要什么材料' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款申请要带什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款申请要带什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款申请要准备哪些材料' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款申请要准备哪些材料');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款申请资料有哪些' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款申请资料有哪些');

-- 183. 公积金 / 公积金贷款申请可以网上办理吗
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金贷款申请可以网上办理吗', '公积金贷款别等到签合同后才去问资格，最好提前查。现在很多地方都支持线上办，但不是所有地区、所有情形都一样。最稳的办法是先在北京住房公积金网、属地住房公积金管理中心或政务服务网上搜索事项名称，能提交就直接线上办；如果页面提示要现场核验，再按提示去窗口，不用一开始就来回跑。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款申请可以网上办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款申请可以网上办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款申请能网上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款申请能网上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款申请可以线上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款申请可以线上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款申请手机上能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款申请手机上能办吗');

-- 184. 公积金 / 公积金贷款申请在哪里办理
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金贷款申请在哪里办理', '公积金贷款别等到签合同后才去问资格，最好提前查。先别急着直接跑大厅，先在北京住房公积金网、属地住房公积金管理中心或政务服务网查办理入口、受理机构和办公时间。能线上办的直接在线提交，必须现场办的，再去属地窗口。这样做最实际，能避免跑错地方或者排队后才发现材料不对。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款申请在哪里办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款申请在哪里办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款申请去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款申请去哪里办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款申请在哪办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款申请在哪办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款申请在哪个窗口办理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款申请在哪个窗口办理');

-- 185. 公积金 / 公积金贷款申请办理后多久生效
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金贷款申请办理后多久生效', '公积金贷款别等到签合同后才去问资格，最好提前查。这个没有全国统一到“几天”的固定答案，通常要看你所在地区、材料是否齐全、系统能不能自动核验。对普通人来说，最关键不是死盯天数，而是先把信息一次填对、材料一次交齐，这样通常会快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款申请办理后多久生效');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款申请办理后多久生效' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款申请多久能办好' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款申请多久能办好');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款申请多久生效' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款申请多久生效');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款申请一般要几天' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款申请一般要几天');

-- 186. 公积金 / 公积金贷款申请如何查询进度
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金贷款申请如何查询进度', '公积金贷款别等到签合同后才去问资格，最好提前查。如果你已经提交申请，通常先在北京住房公积金网、属地住房公积金管理中心或政务服务网看有没有“我的办件”“办理进度”或查询入口。线上查不到时，再拿受理编号、身份证去窗口或打官方电话问。最有用的是把受理时间和编号先记下来，后面查起来快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款申请如何查询进度');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款申请如何查询进度' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款申请进度怎么查' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款申请进度怎么查');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款申请审核到哪了' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款申请审核到哪了');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么查公积金贷款申请办理进度' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么查公积金贷款申请办理进度');

-- 187. 公积金 / 公积金贷款申请需要满足什么条件
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金贷款申请需要满足什么条件', '公积金贷款别等到签合同后才去问资格，最好提前查。先别急着准备材料，先看自己是不是符合基本条件。大多数人办不下来，不是不会操作，而是条件没对上。最稳的办法是先在北京住房公积金网、属地住房公积金管理中心或政务服务网看适用对象、缴费要求、婚育情况或账户状态，再决定要不要申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款申请需要满足什么条件');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款申请需要满足什么条件' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款申请要什么条件' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款申请要什么条件');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款申请申请条件是什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款申请申请条件是什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '哪些人能办公积金贷款申请' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '哪些人能办公积金贷款申请');

-- 188. 公积金 / 公积金贷款申请能否代办
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金贷款申请能否代办', '公积金贷款别等到签合同后才去问资格，最好提前查。很多事项不是完全不能代办，但代办时通常要多准备委托说明、双方身份证明或其他补充材料。你最好先在北京住房公积金网、属地住房公积金管理中心或政务服务网查一下是否支持代办；如果本来就能本人线上办，通常自己操作会更快，也更不容易出错。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款申请能否代办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款申请能否代办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款申请可以代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款申请可以代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款申请能找人代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款申请能找人代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款申请能委托别人办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款申请能委托别人办吗');

-- 189. 公积金 / 公积金贷款申请异地可以办理吗
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金贷款申请异地可以办理吗', '公积金贷款别等到签合同后才去问资格，最好提前查。现在不少事项已经支持异地办或跨省通办，但不是所有地方都完全打通。最实际的做法是先在北京住房公积金网、属地住房公积金管理中心或政务服务网确认这个事项有没有异地入口；如果有就按流程在线提交，没有的话再问清楚是回原地办，还是在现居地先申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款申请异地可以办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款申请异地可以办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款申请外地能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款申请外地能办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款申请异地怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款申请异地怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款申请跨省能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款申请跨省能办吗');

-- 190. 公积金 / 公积金贷款申请办理失败怎么办
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金贷款申请办理失败怎么办', '公积金贷款别等到签合同后才去问资格，最好提前查。别一被退回就重新乱提交，先看清楚退回原因。大多数情况无非是条件不符、材料不全、信息填错或系统核验不过。先把退回提示逐项改掉，再重新提交；如果提示看不懂，就直接找北京住房公积金网、属地住房公积金管理中心或政务服务网对应的官方窗口或服务热线问清楚。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款申请办理失败怎么办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款申请办理失败怎么办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款申请办不下来怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款申请办不下来怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款申请被退回怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款申请被退回怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款申请申请失败怎么处理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款申请申请失败怎么处理');

-- 191. 公积金 / 公积金贷款额度与条件如何办理
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金贷款额度与条件如何办理', '公积金贷款额度不是只看余额，很多人容易误会这一点。最方便的做法是先在北京住房公积金网、属地住房公积金管理中心或政务服务网上搜这个事项，看能不能直接线上办。能线上提交的，就按页面一步步填信息、传材料；线上办不了的，再带身份证和相关材料去窗口。先查入口再出门，通常能少跑一趟。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款额度与条件如何办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款额度与条件如何办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款额度与条件怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款额度与条件怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么办理公积金贷款额度与条件' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么办理公积金贷款额度与条件');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款额度与条件去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款额度与条件去哪里办');

-- 192. 公积金 / 公积金贷款额度与条件需要什么材料
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金贷款额度与条件需要什么材料', '公积金贷款额度不是只看余额，很多人容易误会这一点。一般先准备身份证，另外再按事项准备对应证明材料。很多人容易一上来准备一大堆，其实没必要，先去北京住房公积金网、属地住房公积金管理中心或政务服务网看清单最省事；能系统核验的材料通常不用重复提交，页面提示缺什么再补什么。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款额度与条件需要什么材料');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款额度与条件需要什么材料' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款额度与条件要带什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款额度与条件要带什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款额度与条件要准备哪些材料' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款额度与条件要准备哪些材料');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款额度与条件资料有哪些' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款额度与条件资料有哪些');

-- 193. 公积金 / 公积金贷款额度与条件可以网上办理吗
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金贷款额度与条件可以网上办理吗', '公积金贷款额度不是只看余额，很多人容易误会这一点。现在很多地方都支持线上办，但不是所有地区、所有情形都一样。最稳的办法是先在北京住房公积金网、属地住房公积金管理中心或政务服务网上搜索事项名称，能提交就直接线上办；如果页面提示要现场核验，再按提示去窗口，不用一开始就来回跑。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款额度与条件可以网上办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款额度与条件可以网上办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款额度与条件能网上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款额度与条件能网上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款额度与条件可以线上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款额度与条件可以线上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款额度与条件手机上能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款额度与条件手机上能办吗');

-- 194. 公积金 / 公积金贷款额度与条件在哪里办理
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金贷款额度与条件在哪里办理', '公积金贷款额度不是只看余额，很多人容易误会这一点。先别急着直接跑大厅，先在北京住房公积金网、属地住房公积金管理中心或政务服务网查办理入口、受理机构和办公时间。能线上办的直接在线提交，必须现场办的，再去属地窗口。这样做最实际，能避免跑错地方或者排队后才发现材料不对。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款额度与条件在哪里办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款额度与条件在哪里办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款额度与条件去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款额度与条件去哪里办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款额度与条件在哪办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款额度与条件在哪办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款额度与条件在哪个窗口办理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款额度与条件在哪个窗口办理');

-- 195. 公积金 / 公积金贷款额度与条件办理后多久生效
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金贷款额度与条件办理后多久生效', '公积金贷款额度不是只看余额，很多人容易误会这一点。这个没有全国统一到“几天”的固定答案，通常要看你所在地区、材料是否齐全、系统能不能自动核验。对普通人来说，最关键不是死盯天数，而是先把信息一次填对、材料一次交齐，这样通常会快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款额度与条件办理后多久生效');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款额度与条件办理后多久生效' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款额度与条件多久能办好' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款额度与条件多久能办好');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款额度与条件多久生效' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款额度与条件多久生效');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款额度与条件一般要几天' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款额度与条件一般要几天');

-- 196. 公积金 / 公积金贷款额度与条件如何查询进度
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金贷款额度与条件如何查询进度', '公积金贷款额度不是只看余额，很多人容易误会这一点。如果你已经提交申请，通常先在北京住房公积金网、属地住房公积金管理中心或政务服务网看有没有“我的办件”“办理进度”或查询入口。线上查不到时，再拿受理编号、身份证去窗口或打官方电话问。最有用的是把受理时间和编号先记下来，后面查起来快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款额度与条件如何查询进度');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款额度与条件如何查询进度' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款额度与条件进度怎么查' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款额度与条件进度怎么查');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款额度与条件审核到哪了' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款额度与条件审核到哪了');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么查公积金贷款额度与条件办理进度' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么查公积金贷款额度与条件办理进度');

-- 197. 公积金 / 公积金贷款额度与条件需要满足什么条件
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金贷款额度与条件需要满足什么条件', '公积金贷款额度不是只看余额，很多人容易误会这一点。先别急着准备材料，先看自己是不是符合基本条件。大多数人办不下来，不是不会操作，而是条件没对上。最稳的办法是先在北京住房公积金网、属地住房公积金管理中心或政务服务网看适用对象、缴费要求、婚育情况或账户状态，再决定要不要申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款额度与条件需要满足什么条件');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款额度与条件需要满足什么条件' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款额度与条件要什么条件' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款额度与条件要什么条件');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款额度与条件申请条件是什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款额度与条件申请条件是什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '哪些人能办公积金贷款额度与条件' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '哪些人能办公积金贷款额度与条件');

-- 198. 公积金 / 公积金贷款额度与条件能否代办
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金贷款额度与条件能否代办', '公积金贷款额度不是只看余额，很多人容易误会这一点。很多事项不是完全不能代办，但代办时通常要多准备委托说明、双方身份证明或其他补充材料。你最好先在北京住房公积金网、属地住房公积金管理中心或政务服务网查一下是否支持代办；如果本来就能本人线上办，通常自己操作会更快，也更不容易出错。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款额度与条件能否代办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款额度与条件能否代办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款额度与条件可以代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款额度与条件可以代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款额度与条件能找人代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款额度与条件能找人代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款额度与条件能委托别人办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款额度与条件能委托别人办吗');

-- 199. 公积金 / 公积金贷款额度与条件异地可以办理吗
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金贷款额度与条件异地可以办理吗', '公积金贷款额度不是只看余额，很多人容易误会这一点。现在不少事项已经支持异地办或跨省通办，但不是所有地方都完全打通。最实际的做法是先在北京住房公积金网、属地住房公积金管理中心或政务服务网确认这个事项有没有异地入口；如果有就按流程在线提交，没有的话再问清楚是回原地办，还是在现居地先申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款额度与条件异地可以办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款额度与条件异地可以办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款额度与条件外地能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款额度与条件外地能办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款额度与条件异地怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款额度与条件异地怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款额度与条件跨省能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款额度与条件跨省能办吗');

-- 200. 公积金 / 公积金贷款额度与条件办理失败怎么办
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金贷款额度与条件办理失败怎么办', '公积金贷款额度不是只看余额，很多人容易误会这一点。别一被退回就重新乱提交，先看清楚退回原因。大多数情况无非是条件不符、材料不全、信息填错或系统核验不过。先把退回提示逐项改掉，再重新提交；如果提示看不懂，就直接找北京住房公积金网、属地住房公积金管理中心或政务服务网对应的官方窗口或服务热线问清楚。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款额度与条件办理失败怎么办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款额度与条件办理失败怎么办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款额度与条件办不下来怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款额度与条件办不下来怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款额度与条件被退回怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款额度与条件被退回怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款额度与条件申请失败怎么处理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款额度与条件申请失败怎么处理');

-- 201. 公积金 / 公积金贷款还款与提前还款如何办理
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金贷款还款与提前还款如何办理', '公积金贷款还款和提前还款都要先确认自己的贷款状态。最方便的做法是先在北京住房公积金网、属地住房公积金管理中心或贷款服务渠道上搜这个事项，看能不能直接线上办。能线上提交的，就按页面一步步填信息、传材料；线上办不了的，再带身份证和相关材料去窗口。先查入口再出门，通常能少跑一趟。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款还款与提前还款如何办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款还款与提前还款如何办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款还款与提前还款怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款还款与提前还款怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么办理公积金贷款还款与提前还款' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么办理公积金贷款还款与提前还款');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款还款与提前还款去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款还款与提前还款去哪里办');

-- 202. 公积金 / 公积金贷款还款与提前还款需要什么材料
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金贷款还款与提前还款需要什么材料', '公积金贷款还款和提前还款都要先确认自己的贷款状态。一般先准备身份证，另外再按事项准备对应证明材料。很多人容易一上来准备一大堆，其实没必要，先去北京住房公积金网、属地住房公积金管理中心或贷款服务渠道看清单最省事；能系统核验的材料通常不用重复提交，页面提示缺什么再补什么。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款还款与提前还款需要什么材料');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款还款与提前还款需要什么材料' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款还款与提前还款要带什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款还款与提前还款要带什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款还款与提前还款要准备哪些材料' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款还款与提前还款要准备哪些材料');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款还款与提前还款资料有哪些' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款还款与提前还款资料有哪些');

-- 203. 公积金 / 公积金贷款还款与提前还款可以网上办理吗
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金贷款还款与提前还款可以网上办理吗', '公积金贷款还款和提前还款都要先确认自己的贷款状态。现在很多地方都支持线上办，但不是所有地区、所有情形都一样。最稳的办法是先在北京住房公积金网、属地住房公积金管理中心或贷款服务渠道上搜索事项名称，能提交就直接线上办；如果页面提示要现场核验，再按提示去窗口，不用一开始就来回跑。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款还款与提前还款可以网上办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款还款与提前还款可以网上办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款还款与提前还款能网上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款还款与提前还款能网上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款还款与提前还款可以线上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款还款与提前还款可以线上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款还款与提前还款手机上能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款还款与提前还款手机上能办吗');

-- 204. 公积金 / 公积金贷款还款与提前还款在哪里办理
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金贷款还款与提前还款在哪里办理', '公积金贷款还款和提前还款都要先确认自己的贷款状态。先别急着直接跑大厅，先在北京住房公积金网、属地住房公积金管理中心或贷款服务渠道查办理入口、受理机构和办公时间。能线上办的直接在线提交，必须现场办的，再去属地窗口。这样做最实际，能避免跑错地方或者排队后才发现材料不对。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款还款与提前还款在哪里办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款还款与提前还款在哪里办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款还款与提前还款去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款还款与提前还款去哪里办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款还款与提前还款在哪办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款还款与提前还款在哪办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款还款与提前还款在哪个窗口办理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款还款与提前还款在哪个窗口办理');

-- 205. 公积金 / 公积金贷款还款与提前还款办理后多久生效
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金贷款还款与提前还款办理后多久生效', '公积金贷款还款和提前还款都要先确认自己的贷款状态。这个没有全国统一到“几天”的固定答案，通常要看你所在地区、材料是否齐全、系统能不能自动核验。对普通人来说，最关键不是死盯天数，而是先把信息一次填对、材料一次交齐，这样通常会快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款还款与提前还款办理后多久生效');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款还款与提前还款办理后多久生效' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款还款与提前还款多久能办好' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款还款与提前还款多久能办好');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款还款与提前还款多久生效' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款还款与提前还款多久生效');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款还款与提前还款一般要几天' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款还款与提前还款一般要几天');

-- 206. 公积金 / 公积金贷款还款与提前还款如何查询进度
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金贷款还款与提前还款如何查询进度', '公积金贷款还款和提前还款都要先确认自己的贷款状态。如果你已经提交申请，通常先在北京住房公积金网、属地住房公积金管理中心或贷款服务渠道看有没有“我的办件”“办理进度”或查询入口。线上查不到时，再拿受理编号、身份证去窗口或打官方电话问。最有用的是把受理时间和编号先记下来，后面查起来快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款还款与提前还款如何查询进度');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款还款与提前还款如何查询进度' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款还款与提前还款进度怎么查' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款还款与提前还款进度怎么查');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款还款与提前还款审核到哪了' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款还款与提前还款审核到哪了');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么查公积金贷款还款与提前还款办理进度' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么查公积金贷款还款与提前还款办理进度');

-- 207. 公积金 / 公积金贷款还款与提前还款需要满足什么条件
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金贷款还款与提前还款需要满足什么条件', '公积金贷款还款和提前还款都要先确认自己的贷款状态。先别急着准备材料，先看自己是不是符合基本条件。大多数人办不下来，不是不会操作，而是条件没对上。最稳的办法是先在北京住房公积金网、属地住房公积金管理中心或贷款服务渠道看适用对象、缴费要求、婚育情况或账户状态，再决定要不要申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款还款与提前还款需要满足什么条件');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款还款与提前还款需要满足什么条件' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款还款与提前还款要什么条件' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款还款与提前还款要什么条件');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款还款与提前还款申请条件是什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款还款与提前还款申请条件是什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '哪些人能办公积金贷款还款与提前还款' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '哪些人能办公积金贷款还款与提前还款');

-- 208. 公积金 / 公积金贷款还款与提前还款能否代办
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金贷款还款与提前还款能否代办', '公积金贷款还款和提前还款都要先确认自己的贷款状态。很多事项不是完全不能代办，但代办时通常要多准备委托说明、双方身份证明或其他补充材料。你最好先在北京住房公积金网、属地住房公积金管理中心或贷款服务渠道查一下是否支持代办；如果本来就能本人线上办，通常自己操作会更快，也更不容易出错。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款还款与提前还款能否代办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款还款与提前还款能否代办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款还款与提前还款可以代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款还款与提前还款可以代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款还款与提前还款能找人代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款还款与提前还款能找人代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款还款与提前还款能委托别人办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款还款与提前还款能委托别人办吗');

-- 209. 公积金 / 公积金贷款还款与提前还款异地可以办理吗
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金贷款还款与提前还款异地可以办理吗', '公积金贷款还款和提前还款都要先确认自己的贷款状态。现在不少事项已经支持异地办或跨省通办，但不是所有地方都完全打通。最实际的做法是先在北京住房公积金网、属地住房公积金管理中心或贷款服务渠道确认这个事项有没有异地入口；如果有就按流程在线提交，没有的话再问清楚是回原地办，还是在现居地先申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款还款与提前还款异地可以办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款还款与提前还款异地可以办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款还款与提前还款外地能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款还款与提前还款外地能办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款还款与提前还款异地怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款还款与提前还款异地怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款还款与提前还款跨省能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款还款与提前还款跨省能办吗');

-- 210. 公积金 / 公积金贷款还款与提前还款办理失败怎么办
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金贷款还款与提前还款办理失败怎么办', '公积金贷款还款和提前还款都要先确认自己的贷款状态。别一被退回就重新乱提交，先看清楚退回原因。大多数情况无非是条件不符、材料不全、信息填错或系统核验不过。先把退回提示逐项改掉，再重新提交；如果提示看不懂，就直接找北京住房公积金网、属地住房公积金管理中心或贷款服务渠道对应的官方窗口或服务热线问清楚。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款还款与提前还款办理失败怎么办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金贷款还款与提前还款办理失败怎么办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款还款与提前还款办不下来怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款还款与提前还款办不下来怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款还款与提前还款被退回怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款还款与提前还款被退回怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金贷款还款与提前还款申请失败怎么处理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金贷款还款与提前还款申请失败怎么处理');

-- 211. 公积金 / 公积金异地转移接续与跨省通办如何办理
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金异地转移接续与跨省通办如何办理', '换城市后，公积金异地转移现在比以前方便不少。最方便的做法是先在北京住房公积金网、属地住房公积金管理中心或跨省通办服务渠道上搜这个事项，看能不能直接线上办。能线上提交的，就按页面一步步填信息、传材料；线上办不了的，再带身份证和相关材料去窗口。先查入口再出门，通常能少跑一趟。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金异地转移接续与跨省通办如何办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金异地转移接续与跨省通办如何办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金异地转移接续与跨省通办怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金异地转移接续与跨省通办怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么办理公积金异地转移接续与跨省通办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么办理公积金异地转移接续与跨省通办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金异地转移接续与跨省通办去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金异地转移接续与跨省通办去哪里办');

-- 212. 公积金 / 公积金异地转移接续与跨省通办需要什么材料
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金异地转移接续与跨省通办需要什么材料', '换城市后，公积金异地转移现在比以前方便不少。一般先准备身份证，另外再按事项准备对应证明材料。很多人容易一上来准备一大堆，其实没必要，先去北京住房公积金网、属地住房公积金管理中心或跨省通办服务渠道看清单最省事；能系统核验的材料通常不用重复提交，页面提示缺什么再补什么。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金异地转移接续与跨省通办需要什么材料');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金异地转移接续与跨省通办需要什么材料' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金异地转移接续与跨省通办要带什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金异地转移接续与跨省通办要带什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金异地转移接续与跨省通办要准备哪些材料' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金异地转移接续与跨省通办要准备哪些材料');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金异地转移接续与跨省通办资料有哪些' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金异地转移接续与跨省通办资料有哪些');

-- 213. 公积金 / 公积金异地转移接续与跨省通办可以网上办理吗
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金异地转移接续与跨省通办可以网上办理吗', '换城市后，公积金异地转移现在比以前方便不少。现在很多地方都支持线上办，但不是所有地区、所有情形都一样。最稳的办法是先在北京住房公积金网、属地住房公积金管理中心或跨省通办服务渠道上搜索事项名称，能提交就直接线上办；如果页面提示要现场核验，再按提示去窗口，不用一开始就来回跑。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金异地转移接续与跨省通办可以网上办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金异地转移接续与跨省通办可以网上办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金异地转移接续与跨省通办能网上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金异地转移接续与跨省通办能网上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金异地转移接续与跨省通办可以线上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金异地转移接续与跨省通办可以线上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金异地转移接续与跨省通办手机上能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金异地转移接续与跨省通办手机上能办吗');

-- 214. 公积金 / 公积金异地转移接续与跨省通办在哪里办理
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金异地转移接续与跨省通办在哪里办理', '换城市后，公积金异地转移现在比以前方便不少。先别急着直接跑大厅，先在北京住房公积金网、属地住房公积金管理中心或跨省通办服务渠道查办理入口、受理机构和办公时间。能线上办的直接在线提交，必须现场办的，再去属地窗口。这样做最实际，能避免跑错地方或者排队后才发现材料不对。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金异地转移接续与跨省通办在哪里办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金异地转移接续与跨省通办在哪里办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金异地转移接续与跨省通办去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金异地转移接续与跨省通办去哪里办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金异地转移接续与跨省通办在哪办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金异地转移接续与跨省通办在哪办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金异地转移接续与跨省通办在哪个窗口办理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金异地转移接续与跨省通办在哪个窗口办理');

-- 215. 公积金 / 公积金异地转移接续与跨省通办办理后多久生效
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金异地转移接续与跨省通办办理后多久生效', '换城市后，公积金异地转移现在比以前方便不少。这个没有全国统一到“几天”的固定答案，通常要看你所在地区、材料是否齐全、系统能不能自动核验。对普通人来说，最关键不是死盯天数，而是先把信息一次填对、材料一次交齐，这样通常会快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金异地转移接续与跨省通办办理后多久生效');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金异地转移接续与跨省通办办理后多久生效' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金异地转移接续与跨省通办多久能办好' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金异地转移接续与跨省通办多久能办好');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金异地转移接续与跨省通办多久生效' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金异地转移接续与跨省通办多久生效');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金异地转移接续与跨省通办一般要几天' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金异地转移接续与跨省通办一般要几天');

-- 216. 公积金 / 公积金异地转移接续与跨省通办如何查询进度
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金异地转移接续与跨省通办如何查询进度', '换城市后，公积金异地转移现在比以前方便不少。如果你已经提交申请，通常先在北京住房公积金网、属地住房公积金管理中心或跨省通办服务渠道看有没有“我的办件”“办理进度”或查询入口。线上查不到时，再拿受理编号、身份证去窗口或打官方电话问。最有用的是把受理时间和编号先记下来，后面查起来快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金异地转移接续与跨省通办如何查询进度');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金异地转移接续与跨省通办如何查询进度' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金异地转移接续与跨省通办进度怎么查' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金异地转移接续与跨省通办进度怎么查');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金异地转移接续与跨省通办审核到哪了' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金异地转移接续与跨省通办审核到哪了');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么查公积金异地转移接续与跨省通办办理进度' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么查公积金异地转移接续与跨省通办办理进度');

-- 217. 公积金 / 公积金异地转移接续与跨省通办需要满足什么条件
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金异地转移接续与跨省通办需要满足什么条件', '换城市后，公积金异地转移现在比以前方便不少。先别急着准备材料，先看自己是不是符合基本条件。大多数人办不下来，不是不会操作，而是条件没对上。最稳的办法是先在北京住房公积金网、属地住房公积金管理中心或跨省通办服务渠道看适用对象、缴费要求、婚育情况或账户状态，再决定要不要申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金异地转移接续与跨省通办需要满足什么条件');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金异地转移接续与跨省通办需要满足什么条件' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金异地转移接续与跨省通办要什么条件' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金异地转移接续与跨省通办要什么条件');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金异地转移接续与跨省通办申请条件是什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金异地转移接续与跨省通办申请条件是什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '哪些人能办公积金异地转移接续与跨省通办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '哪些人能办公积金异地转移接续与跨省通办');

-- 218. 公积金 / 公积金异地转移接续与跨省通办能否代办
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金异地转移接续与跨省通办能否代办', '换城市后，公积金异地转移现在比以前方便不少。很多事项不是完全不能代办，但代办时通常要多准备委托说明、双方身份证明或其他补充材料。你最好先在北京住房公积金网、属地住房公积金管理中心或跨省通办服务渠道查一下是否支持代办；如果本来就能本人线上办，通常自己操作会更快，也更不容易出错。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金异地转移接续与跨省通办能否代办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金异地转移接续与跨省通办能否代办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金异地转移接续与跨省通办可以代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金异地转移接续与跨省通办可以代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金异地转移接续与跨省通办能找人代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金异地转移接续与跨省通办能找人代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金异地转移接续与跨省通办能委托别人办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金异地转移接续与跨省通办能委托别人办吗');

-- 219. 公积金 / 公积金异地转移接续与跨省通办异地可以办理吗
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金异地转移接续与跨省通办异地可以办理吗', '换城市后，公积金异地转移现在比以前方便不少。现在不少事项已经支持异地办或跨省通办，但不是所有地方都完全打通。最实际的做法是先在北京住房公积金网、属地住房公积金管理中心或跨省通办服务渠道确认这个事项有没有异地入口；如果有就按流程在线提交，没有的话再问清楚是回原地办，还是在现居地先申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金异地转移接续与跨省通办异地可以办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金异地转移接续与跨省通办异地可以办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金异地转移接续与跨省通办外地能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金异地转移接续与跨省通办外地能办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金异地转移接续与跨省通办异地怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金异地转移接续与跨省通办异地怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金异地转移接续与跨省通办跨省能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金异地转移接续与跨省通办跨省能办吗');

-- 220. 公积金 / 公积金异地转移接续与跨省通办办理失败怎么办
SET @category_id := (SELECT id FROM category WHERE name = '公积金' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '公积金异地转移接续与跨省通办办理失败怎么办', '换城市后，公积金异地转移现在比以前方便不少。别一被退回就重新乱提交，先看清楚退回原因。大多数情况无非是条件不符、材料不全、信息填错或系统核验不过。先把退回提示逐项改掉，再重新提交；如果提示看不懂，就直接找北京住房公积金网、属地住房公积金管理中心或跨省通办服务渠道对应的官方窗口或服务热线问清楚。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '公积金异地转移接续与跨省通办办理失败怎么办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '公积金异地转移接续与跨省通办办理失败怎么办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金异地转移接续与跨省通办办不下来怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金异地转移接续与跨省通办办不下来怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金异地转移接续与跨省通办被退回怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金异地转移接续与跨省通办被退回怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '公积金异地转移接续与跨省通办申请失败怎么处理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '公积金异地转移接续与跨省通办申请失败怎么处理');

-- 221. 计划生育 / 生育登记办理如何办理
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '生育登记办理如何办理', '生育登记一般不算复杂，先找对入口最重要。最方便的做法是先在国家政务服务平台生育服务专区、属地卫生健康部门政务服务网或线下窗口上搜这个事项，看能不能直接线上办。能线上提交的，就按页面一步步填信息、传材料；线上办不了的，再带身份证和相关材料去窗口。先查入口再出门，通常能少跑一趟。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '生育登记办理如何办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '生育登记办理如何办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记办理怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记办理怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么办理生育登记办理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么办理生育登记办理');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记办理去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记办理去哪里办');

-- 222. 计划生育 / 生育登记办理需要什么材料
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '生育登记办理需要什么材料', '生育登记一般不算复杂，先找对入口最重要。一般先准备身份证，另外再按事项准备对应证明材料。很多人容易一上来准备一大堆，其实没必要，先去国家政务服务平台生育服务专区、属地卫生健康部门政务服务网或线下窗口看清单最省事；能系统核验的材料通常不用重复提交，页面提示缺什么再补什么。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '生育登记办理需要什么材料');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '生育登记办理需要什么材料' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记办理要带什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记办理要带什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记办理要准备哪些材料' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记办理要准备哪些材料');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记办理资料有哪些' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记办理资料有哪些');

-- 223. 计划生育 / 生育登记办理可以网上办理吗
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '生育登记办理可以网上办理吗', '生育登记一般不算复杂，先找对入口最重要。现在很多地方都支持线上办，但不是所有地区、所有情形都一样。最稳的办法是先在国家政务服务平台生育服务专区、属地卫生健康部门政务服务网或线下窗口上搜索事项名称，能提交就直接线上办；如果页面提示要现场核验，再按提示去窗口，不用一开始就来回跑。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '生育登记办理可以网上办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '生育登记办理可以网上办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记办理能网上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记办理能网上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记办理可以线上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记办理可以线上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记办理手机上能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记办理手机上能办吗');

-- 224. 计划生育 / 生育登记办理在哪里办理
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '生育登记办理在哪里办理', '生育登记一般不算复杂，先找对入口最重要。先别急着直接跑大厅，先在国家政务服务平台生育服务专区、属地卫生健康部门政务服务网或线下窗口查办理入口、受理机构和办公时间。能线上办的直接在线提交，必须现场办的，再去属地窗口。这样做最实际，能避免跑错地方或者排队后才发现材料不对。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '生育登记办理在哪里办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '生育登记办理在哪里办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记办理去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记办理去哪里办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记办理在哪办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记办理在哪办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记办理在哪个窗口办理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记办理在哪个窗口办理');

-- 225. 计划生育 / 生育登记办理办理后多久生效
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '生育登记办理办理后多久生效', '生育登记一般不算复杂，先找对入口最重要。这个没有全国统一到“几天”的固定答案，通常要看你所在地区、材料是否齐全、系统能不能自动核验。对普通人来说，最关键不是死盯天数，而是先把信息一次填对、材料一次交齐，这样通常会快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '生育登记办理办理后多久生效');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '生育登记办理办理后多久生效' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记办理多久能办好' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记办理多久能办好');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记办理多久生效' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记办理多久生效');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记办理一般要几天' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记办理一般要几天');

-- 226. 计划生育 / 生育登记办理如何查询进度
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '生育登记办理如何查询进度', '生育登记一般不算复杂，先找对入口最重要。如果你已经提交申请，通常先在国家政务服务平台生育服务专区、属地卫生健康部门政务服务网或线下窗口看有没有“我的办件”“办理进度”或查询入口。线上查不到时，再拿受理编号、身份证去窗口或打官方电话问。最有用的是把受理时间和编号先记下来，后面查起来快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '生育登记办理如何查询进度');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '生育登记办理如何查询进度' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记办理进度怎么查' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记办理进度怎么查');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记办理审核到哪了' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记办理审核到哪了');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么查生育登记办理办理进度' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么查生育登记办理办理进度');

-- 227. 计划生育 / 生育登记办理需要满足什么条件
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '生育登记办理需要满足什么条件', '生育登记一般不算复杂，先找对入口最重要。先别急着准备材料，先看自己是不是符合基本条件。大多数人办不下来，不是不会操作，而是条件没对上。最稳的办法是先在国家政务服务平台生育服务专区、属地卫生健康部门政务服务网或线下窗口看适用对象、缴费要求、婚育情况或账户状态，再决定要不要申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '生育登记办理需要满足什么条件');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '生育登记办理需要满足什么条件' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记办理要什么条件' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记办理要什么条件');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记办理申请条件是什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记办理申请条件是什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '哪些人能办生育登记办理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '哪些人能办生育登记办理');

-- 228. 计划生育 / 生育登记办理能否代办
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '生育登记办理能否代办', '生育登记一般不算复杂，先找对入口最重要。很多事项不是完全不能代办，但代办时通常要多准备委托说明、双方身份证明或其他补充材料。你最好先在国家政务服务平台生育服务专区、属地卫生健康部门政务服务网或线下窗口查一下是否支持代办；如果本来就能本人线上办，通常自己操作会更快，也更不容易出错。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '生育登记办理能否代办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '生育登记办理能否代办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记办理可以代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记办理可以代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记办理能找人代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记办理能找人代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记办理能委托别人办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记办理能委托别人办吗');

-- 229. 计划生育 / 生育登记办理异地可以办理吗
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '生育登记办理异地可以办理吗', '生育登记一般不算复杂，先找对入口最重要。现在不少事项已经支持异地办或跨省通办，但不是所有地方都完全打通。最实际的做法是先在国家政务服务平台生育服务专区、属地卫生健康部门政务服务网或线下窗口确认这个事项有没有异地入口；如果有就按流程在线提交，没有的话再问清楚是回原地办，还是在现居地先申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '生育登记办理异地可以办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '生育登记办理异地可以办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记办理外地能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记办理外地能办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记办理异地怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记办理异地怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记办理跨省能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记办理跨省能办吗');

-- 230. 计划生育 / 生育登记办理办理失败怎么办
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '生育登记办理办理失败怎么办', '生育登记一般不算复杂，先找对入口最重要。别一被退回就重新乱提交，先看清楚退回原因。大多数情况无非是条件不符、材料不全、信息填错或系统核验不过。先把退回提示逐项改掉，再重新提交；如果提示看不懂，就直接找国家政务服务平台生育服务专区、属地卫生健康部门政务服务网或线下窗口对应的官方窗口或服务热线问清楚。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '生育登记办理办理失败怎么办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '生育登记办理办理失败怎么办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记办理办不下来怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记办理办不下来怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记办理被退回怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记办理被退回怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记办理申请失败怎么处理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记办理申请失败怎么处理');

-- 231. 计划生育 / 生育登记材料审核如何办理
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '生育登记材料审核如何办理', '生育登记材料现在很多地方已经精简了。最方便的做法是先在国家政务服务平台生育服务专区、属地卫生健康部门政务服务网或线下窗口上搜这个事项，看能不能直接线上办。能线上提交的，就按页面一步步填信息、传材料；线上办不了的，再带身份证和相关材料去窗口。先查入口再出门，通常能少跑一趟。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '生育登记材料审核如何办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '生育登记材料审核如何办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记材料审核怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记材料审核怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么办理生育登记材料审核' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么办理生育登记材料审核');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记材料审核去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记材料审核去哪里办');

-- 232. 计划生育 / 生育登记材料审核需要什么材料
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '生育登记材料审核需要什么材料', '生育登记材料现在很多地方已经精简了。一般先准备身份证，另外再按事项准备对应证明材料。很多人容易一上来准备一大堆，其实没必要，先去国家政务服务平台生育服务专区、属地卫生健康部门政务服务网或线下窗口看清单最省事；能系统核验的材料通常不用重复提交，页面提示缺什么再补什么。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '生育登记材料审核需要什么材料');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '生育登记材料审核需要什么材料' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记材料审核要带什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记材料审核要带什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记材料审核要准备哪些材料' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记材料审核要准备哪些材料');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记材料审核资料有哪些' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记材料审核资料有哪些');

-- 233. 计划生育 / 生育登记材料审核可以网上办理吗
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '生育登记材料审核可以网上办理吗', '生育登记材料现在很多地方已经精简了。现在很多地方都支持线上办，但不是所有地区、所有情形都一样。最稳的办法是先在国家政务服务平台生育服务专区、属地卫生健康部门政务服务网或线下窗口上搜索事项名称，能提交就直接线上办；如果页面提示要现场核验，再按提示去窗口，不用一开始就来回跑。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '生育登记材料审核可以网上办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '生育登记材料审核可以网上办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记材料审核能网上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记材料审核能网上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记材料审核可以线上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记材料审核可以线上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记材料审核手机上能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记材料审核手机上能办吗');

-- 234. 计划生育 / 生育登记材料审核在哪里办理
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '生育登记材料审核在哪里办理', '生育登记材料现在很多地方已经精简了。先别急着直接跑大厅，先在国家政务服务平台生育服务专区、属地卫生健康部门政务服务网或线下窗口查办理入口、受理机构和办公时间。能线上办的直接在线提交，必须现场办的，再去属地窗口。这样做最实际，能避免跑错地方或者排队后才发现材料不对。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '生育登记材料审核在哪里办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '生育登记材料审核在哪里办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记材料审核去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记材料审核去哪里办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记材料审核在哪办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记材料审核在哪办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记材料审核在哪个窗口办理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记材料审核在哪个窗口办理');

-- 235. 计划生育 / 生育登记材料审核办理后多久生效
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '生育登记材料审核办理后多久生效', '生育登记材料现在很多地方已经精简了。这个没有全国统一到“几天”的固定答案，通常要看你所在地区、材料是否齐全、系统能不能自动核验。对普通人来说，最关键不是死盯天数，而是先把信息一次填对、材料一次交齐，这样通常会快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '生育登记材料审核办理后多久生效');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '生育登记材料审核办理后多久生效' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记材料审核多久能办好' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记材料审核多久能办好');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记材料审核多久生效' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记材料审核多久生效');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记材料审核一般要几天' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记材料审核一般要几天');

-- 236. 计划生育 / 生育登记材料审核如何查询进度
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '生育登记材料审核如何查询进度', '生育登记材料现在很多地方已经精简了。如果你已经提交申请，通常先在国家政务服务平台生育服务专区、属地卫生健康部门政务服务网或线下窗口看有没有“我的办件”“办理进度”或查询入口。线上查不到时，再拿受理编号、身份证去窗口或打官方电话问。最有用的是把受理时间和编号先记下来，后面查起来快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '生育登记材料审核如何查询进度');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '生育登记材料审核如何查询进度' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记材料审核进度怎么查' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记材料审核进度怎么查');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记材料审核审核到哪了' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记材料审核审核到哪了');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么查生育登记材料审核办理进度' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么查生育登记材料审核办理进度');

-- 237. 计划生育 / 生育登记材料审核需要满足什么条件
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '生育登记材料审核需要满足什么条件', '生育登记材料现在很多地方已经精简了。先别急着准备材料，先看自己是不是符合基本条件。大多数人办不下来，不是不会操作，而是条件没对上。最稳的办法是先在国家政务服务平台生育服务专区、属地卫生健康部门政务服务网或线下窗口看适用对象、缴费要求、婚育情况或账户状态，再决定要不要申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '生育登记材料审核需要满足什么条件');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '生育登记材料审核需要满足什么条件' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记材料审核要什么条件' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记材料审核要什么条件');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记材料审核申请条件是什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记材料审核申请条件是什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '哪些人能办生育登记材料审核' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '哪些人能办生育登记材料审核');

-- 238. 计划生育 / 生育登记材料审核能否代办
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '生育登记材料审核能否代办', '生育登记材料现在很多地方已经精简了。很多事项不是完全不能代办，但代办时通常要多准备委托说明、双方身份证明或其他补充材料。你最好先在国家政务服务平台生育服务专区、属地卫生健康部门政务服务网或线下窗口查一下是否支持代办；如果本来就能本人线上办，通常自己操作会更快，也更不容易出错。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '生育登记材料审核能否代办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '生育登记材料审核能否代办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记材料审核可以代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记材料审核可以代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记材料审核能找人代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记材料审核能找人代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记材料审核能委托别人办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记材料审核能委托别人办吗');

-- 239. 计划生育 / 生育登记材料审核异地可以办理吗
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '生育登记材料审核异地可以办理吗', '生育登记材料现在很多地方已经精简了。现在不少事项已经支持异地办或跨省通办，但不是所有地方都完全打通。最实际的做法是先在国家政务服务平台生育服务专区、属地卫生健康部门政务服务网或线下窗口确认这个事项有没有异地入口；如果有就按流程在线提交，没有的话再问清楚是回原地办，还是在现居地先申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '生育登记材料审核异地可以办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '生育登记材料审核异地可以办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记材料审核外地能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记材料审核外地能办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记材料审核异地怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记材料审核异地怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记材料审核跨省能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记材料审核跨省能办吗');

-- 240. 计划生育 / 生育登记材料审核办理失败怎么办
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '生育登记材料审核办理失败怎么办', '生育登记材料现在很多地方已经精简了。别一被退回就重新乱提交，先看清楚退回原因。大多数情况无非是条件不符、材料不全、信息填错或系统核验不过。先把退回提示逐项改掉，再重新提交；如果提示看不懂，就直接找国家政务服务平台生育服务专区、属地卫生健康部门政务服务网或线下窗口对应的官方窗口或服务热线问清楚。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '生育登记材料审核办理失败怎么办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '生育登记材料审核办理失败怎么办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记材料审核办不下来怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记材料审核办不下来怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记材料审核被退回怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记材料审核被退回怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记材料审核申请失败怎么处理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记材料审核申请失败怎么处理');

-- 241. 计划生育 / 生育登记查询与变更如何办理
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '生育登记查询与变更如何办理', '登记后如果信息有变动，最好尽快改，不要一直拖。最方便的做法是先在国家政务服务平台生育服务专区、属地卫生健康部门政务服务网或线下窗口上搜这个事项，看能不能直接线上办。能线上提交的，就按页面一步步填信息、传材料；线上办不了的，再带身份证和相关材料去窗口。先查入口再出门，通常能少跑一趟。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '生育登记查询与变更如何办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '生育登记查询与变更如何办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记查询与变更怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记查询与变更怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么办理生育登记查询与变更' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么办理生育登记查询与变更');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记查询与变更去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记查询与变更去哪里办');

-- 242. 计划生育 / 生育登记查询与变更需要什么材料
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '生育登记查询与变更需要什么材料', '登记后如果信息有变动，最好尽快改，不要一直拖。一般先准备身份证，另外再按事项准备对应证明材料。很多人容易一上来准备一大堆，其实没必要，先去国家政务服务平台生育服务专区、属地卫生健康部门政务服务网或线下窗口看清单最省事；能系统核验的材料通常不用重复提交，页面提示缺什么再补什么。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '生育登记查询与变更需要什么材料');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '生育登记查询与变更需要什么材料' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记查询与变更要带什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记查询与变更要带什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记查询与变更要准备哪些材料' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记查询与变更要准备哪些材料');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记查询与变更资料有哪些' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记查询与变更资料有哪些');

-- 243. 计划生育 / 生育登记查询与变更可以网上办理吗
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '生育登记查询与变更可以网上办理吗', '登记后如果信息有变动，最好尽快改，不要一直拖。现在很多地方都支持线上办，但不是所有地区、所有情形都一样。最稳的办法是先在国家政务服务平台生育服务专区、属地卫生健康部门政务服务网或线下窗口上搜索事项名称，能提交就直接线上办；如果页面提示要现场核验，再按提示去窗口，不用一开始就来回跑。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '生育登记查询与变更可以网上办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '生育登记查询与变更可以网上办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记查询与变更能网上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记查询与变更能网上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记查询与变更可以线上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记查询与变更可以线上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记查询与变更手机上能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记查询与变更手机上能办吗');

-- 244. 计划生育 / 生育登记查询与变更在哪里办理
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '生育登记查询与变更在哪里办理', '登记后如果信息有变动，最好尽快改，不要一直拖。先别急着直接跑大厅，先在国家政务服务平台生育服务专区、属地卫生健康部门政务服务网或线下窗口查办理入口、受理机构和办公时间。能线上办的直接在线提交，必须现场办的，再去属地窗口。这样做最实际，能避免跑错地方或者排队后才发现材料不对。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '生育登记查询与变更在哪里办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '生育登记查询与变更在哪里办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记查询与变更去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记查询与变更去哪里办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记查询与变更在哪办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记查询与变更在哪办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记查询与变更在哪个窗口办理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记查询与变更在哪个窗口办理');

-- 245. 计划生育 / 生育登记查询与变更办理后多久生效
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '生育登记查询与变更办理后多久生效', '登记后如果信息有变动，最好尽快改，不要一直拖。这个没有全国统一到“几天”的固定答案，通常要看你所在地区、材料是否齐全、系统能不能自动核验。对普通人来说，最关键不是死盯天数，而是先把信息一次填对、材料一次交齐，这样通常会快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '生育登记查询与变更办理后多久生效');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '生育登记查询与变更办理后多久生效' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记查询与变更多久能办好' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记查询与变更多久能办好');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记查询与变更多久生效' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记查询与变更多久生效');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记查询与变更一般要几天' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记查询与变更一般要几天');

-- 246. 计划生育 / 生育登记查询与变更如何查询进度
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '生育登记查询与变更如何查询进度', '登记后如果信息有变动，最好尽快改，不要一直拖。如果你已经提交申请，通常先在国家政务服务平台生育服务专区、属地卫生健康部门政务服务网或线下窗口看有没有“我的办件”“办理进度”或查询入口。线上查不到时，再拿受理编号、身份证去窗口或打官方电话问。最有用的是把受理时间和编号先记下来，后面查起来快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '生育登记查询与变更如何查询进度');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '生育登记查询与变更如何查询进度' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记查询与变更进度怎么查' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记查询与变更进度怎么查');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记查询与变更审核到哪了' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记查询与变更审核到哪了');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么查生育登记查询与变更办理进度' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么查生育登记查询与变更办理进度');

-- 247. 计划生育 / 生育登记查询与变更需要满足什么条件
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '生育登记查询与变更需要满足什么条件', '登记后如果信息有变动，最好尽快改，不要一直拖。先别急着准备材料，先看自己是不是符合基本条件。大多数人办不下来，不是不会操作，而是条件没对上。最稳的办法是先在国家政务服务平台生育服务专区、属地卫生健康部门政务服务网或线下窗口看适用对象、缴费要求、婚育情况或账户状态，再决定要不要申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '生育登记查询与变更需要满足什么条件');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '生育登记查询与变更需要满足什么条件' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记查询与变更要什么条件' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记查询与变更要什么条件');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记查询与变更申请条件是什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记查询与变更申请条件是什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '哪些人能办生育登记查询与变更' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '哪些人能办生育登记查询与变更');

-- 248. 计划生育 / 生育登记查询与变更能否代办
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '生育登记查询与变更能否代办', '登记后如果信息有变动，最好尽快改，不要一直拖。很多事项不是完全不能代办，但代办时通常要多准备委托说明、双方身份证明或其他补充材料。你最好先在国家政务服务平台生育服务专区、属地卫生健康部门政务服务网或线下窗口查一下是否支持代办；如果本来就能本人线上办，通常自己操作会更快，也更不容易出错。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '生育登记查询与变更能否代办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '生育登记查询与变更能否代办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记查询与变更可以代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记查询与变更可以代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记查询与变更能找人代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记查询与变更能找人代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记查询与变更能委托别人办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记查询与变更能委托别人办吗');

-- 249. 计划生育 / 生育登记查询与变更异地可以办理吗
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '生育登记查询与变更异地可以办理吗', '登记后如果信息有变动，最好尽快改，不要一直拖。现在不少事项已经支持异地办或跨省通办，但不是所有地方都完全打通。最实际的做法是先在国家政务服务平台生育服务专区、属地卫生健康部门政务服务网或线下窗口确认这个事项有没有异地入口；如果有就按流程在线提交，没有的话再问清楚是回原地办，还是在现居地先申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '生育登记查询与变更异地可以办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '生育登记查询与变更异地可以办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记查询与变更外地能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记查询与变更外地能办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记查询与变更异地怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记查询与变更异地怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记查询与变更跨省能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记查询与变更跨省能办吗');

-- 250. 计划生育 / 生育登记查询与变更办理失败怎么办
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '生育登记查询与变更办理失败怎么办', '登记后如果信息有变动，最好尽快改，不要一直拖。别一被退回就重新乱提交，先看清楚退回原因。大多数情况无非是条件不符、材料不全、信息填错或系统核验不过。先把退回提示逐项改掉，再重新提交；如果提示看不懂，就直接找国家政务服务平台生育服务专区、属地卫生健康部门政务服务网或线下窗口对应的官方窗口或服务热线问清楚。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '生育登记查询与变更办理失败怎么办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '生育登记查询与变更办理失败怎么办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记查询与变更办不下来怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记查询与变更办不下来怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记查询与变更被退回怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记查询与变更被退回怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育登记查询与变更申请失败怎么处理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育登记查询与变更申请失败怎么处理');

-- 251. 计划生育 / 生育服务办理如何办理
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '生育服务办理如何办理', '生育服务事项大多由属地卫健部门统一发布办理口径。最方便的做法是先在国家政务服务平台生育服务专区、属地卫生健康部门政务服务网或线下窗口上搜这个事项，看能不能直接线上办。能线上提交的，就按页面一步步填信息、传材料；线上办不了的，再带身份证和相关材料去窗口。先查入口再出门，通常能少跑一趟。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '生育服务办理如何办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '生育服务办理如何办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育服务办理怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育服务办理怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么办理生育服务办理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么办理生育服务办理');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育服务办理去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育服务办理去哪里办');

-- 252. 计划生育 / 生育服务办理需要什么材料
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '生育服务办理需要什么材料', '生育服务事项大多由属地卫健部门统一发布办理口径。一般先准备身份证，另外再按事项准备对应证明材料。很多人容易一上来准备一大堆，其实没必要，先去国家政务服务平台生育服务专区、属地卫生健康部门政务服务网或线下窗口看清单最省事；能系统核验的材料通常不用重复提交，页面提示缺什么再补什么。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '生育服务办理需要什么材料');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '生育服务办理需要什么材料' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育服务办理要带什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育服务办理要带什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育服务办理要准备哪些材料' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育服务办理要准备哪些材料');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育服务办理资料有哪些' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育服务办理资料有哪些');

-- 253. 计划生育 / 生育服务办理可以网上办理吗
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '生育服务办理可以网上办理吗', '生育服务事项大多由属地卫健部门统一发布办理口径。现在很多地方都支持线上办，但不是所有地区、所有情形都一样。最稳的办法是先在国家政务服务平台生育服务专区、属地卫生健康部门政务服务网或线下窗口上搜索事项名称，能提交就直接线上办；如果页面提示要现场核验，再按提示去窗口，不用一开始就来回跑。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '生育服务办理可以网上办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '生育服务办理可以网上办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育服务办理能网上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育服务办理能网上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育服务办理可以线上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育服务办理可以线上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育服务办理手机上能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育服务办理手机上能办吗');

-- 254. 计划生育 / 生育服务办理在哪里办理
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '生育服务办理在哪里办理', '生育服务事项大多由属地卫健部门统一发布办理口径。先别急着直接跑大厅，先在国家政务服务平台生育服务专区、属地卫生健康部门政务服务网或线下窗口查办理入口、受理机构和办公时间。能线上办的直接在线提交，必须现场办的，再去属地窗口。这样做最实际，能避免跑错地方或者排队后才发现材料不对。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '生育服务办理在哪里办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '生育服务办理在哪里办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育服务办理去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育服务办理去哪里办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育服务办理在哪办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育服务办理在哪办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育服务办理在哪个窗口办理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育服务办理在哪个窗口办理');

-- 255. 计划生育 / 生育服务办理办理后多久生效
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '生育服务办理办理后多久生效', '生育服务事项大多由属地卫健部门统一发布办理口径。这个没有全国统一到“几天”的固定答案，通常要看你所在地区、材料是否齐全、系统能不能自动核验。对普通人来说，最关键不是死盯天数，而是先把信息一次填对、材料一次交齐，这样通常会快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '生育服务办理办理后多久生效');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '生育服务办理办理后多久生效' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育服务办理多久能办好' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育服务办理多久能办好');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育服务办理多久生效' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育服务办理多久生效');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育服务办理一般要几天' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育服务办理一般要几天');

-- 256. 计划生育 / 生育服务办理如何查询进度
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '生育服务办理如何查询进度', '生育服务事项大多由属地卫健部门统一发布办理口径。如果你已经提交申请，通常先在国家政务服务平台生育服务专区、属地卫生健康部门政务服务网或线下窗口看有没有“我的办件”“办理进度”或查询入口。线上查不到时，再拿受理编号、身份证去窗口或打官方电话问。最有用的是把受理时间和编号先记下来，后面查起来快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '生育服务办理如何查询进度');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '生育服务办理如何查询进度' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育服务办理进度怎么查' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育服务办理进度怎么查');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育服务办理审核到哪了' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育服务办理审核到哪了');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么查生育服务办理办理进度' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么查生育服务办理办理进度');

-- 257. 计划生育 / 生育服务办理需要满足什么条件
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '生育服务办理需要满足什么条件', '生育服务事项大多由属地卫健部门统一发布办理口径。先别急着准备材料，先看自己是不是符合基本条件。大多数人办不下来，不是不会操作，而是条件没对上。最稳的办法是先在国家政务服务平台生育服务专区、属地卫生健康部门政务服务网或线下窗口看适用对象、缴费要求、婚育情况或账户状态，再决定要不要申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '生育服务办理需要满足什么条件');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '生育服务办理需要满足什么条件' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育服务办理要什么条件' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育服务办理要什么条件');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育服务办理申请条件是什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育服务办理申请条件是什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '哪些人能办生育服务办理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '哪些人能办生育服务办理');

-- 258. 计划生育 / 生育服务办理能否代办
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '生育服务办理能否代办', '生育服务事项大多由属地卫健部门统一发布办理口径。很多事项不是完全不能代办，但代办时通常要多准备委托说明、双方身份证明或其他补充材料。你最好先在国家政务服务平台生育服务专区、属地卫生健康部门政务服务网或线下窗口查一下是否支持代办；如果本来就能本人线上办，通常自己操作会更快，也更不容易出错。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '生育服务办理能否代办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '生育服务办理能否代办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育服务办理可以代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育服务办理可以代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育服务办理能找人代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育服务办理能找人代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育服务办理能委托别人办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育服务办理能委托别人办吗');

-- 259. 计划生育 / 生育服务办理异地可以办理吗
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '生育服务办理异地可以办理吗', '生育服务事项大多由属地卫健部门统一发布办理口径。现在不少事项已经支持异地办或跨省通办，但不是所有地方都完全打通。最实际的做法是先在国家政务服务平台生育服务专区、属地卫生健康部门政务服务网或线下窗口确认这个事项有没有异地入口；如果有就按流程在线提交，没有的话再问清楚是回原地办，还是在现居地先申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '生育服务办理异地可以办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '生育服务办理异地可以办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育服务办理外地能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育服务办理外地能办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育服务办理异地怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育服务办理异地怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育服务办理跨省能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育服务办理跨省能办吗');

-- 260. 计划生育 / 生育服务办理办理失败怎么办
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '生育服务办理办理失败怎么办', '生育服务事项大多由属地卫健部门统一发布办理口径。别一被退回就重新乱提交，先看清楚退回原因。大多数情况无非是条件不符、材料不全、信息填错或系统核验不过。先把退回提示逐项改掉，再重新提交；如果提示看不懂，就直接找国家政务服务平台生育服务专区、属地卫生健康部门政务服务网或线下窗口对应的官方窗口或服务热线问清楚。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '生育服务办理办理失败怎么办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '生育服务办理办理失败怎么办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育服务办理办不下来怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育服务办理办不下来怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育服务办理被退回怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育服务办理被退回怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '生育服务办理申请失败怎么处理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '生育服务办理申请失败怎么处理');

-- 261. 计划生育 / 孕前优生健康检查如何办理
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '孕前优生健康检查如何办理', '孕前优生健康检查一般属于公共卫生和生育服务的一部分。最方便的做法是先在国家政务服务平台生育服务专区、属地卫生健康部门或妇幼保健机构上搜这个事项，看能不能直接线上办。能线上提交的，就按页面一步步填信息、传材料；线上办不了的，再带身份证和相关材料去窗口。先查入口再出门，通常能少跑一趟。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '孕前优生健康检查如何办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '孕前优生健康检查如何办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '孕前优生健康检查怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '孕前优生健康检查怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么办理孕前优生健康检查' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么办理孕前优生健康检查');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '孕前优生健康检查去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '孕前优生健康检查去哪里办');

-- 262. 计划生育 / 孕前优生健康检查需要什么材料
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '孕前优生健康检查需要什么材料', '孕前优生健康检查一般属于公共卫生和生育服务的一部分。一般先准备身份证，另外再按事项准备对应证明材料。很多人容易一上来准备一大堆，其实没必要，先去国家政务服务平台生育服务专区、属地卫生健康部门或妇幼保健机构看清单最省事；能系统核验的材料通常不用重复提交，页面提示缺什么再补什么。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '孕前优生健康检查需要什么材料');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '孕前优生健康检查需要什么材料' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '孕前优生健康检查要带什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '孕前优生健康检查要带什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '孕前优生健康检查要准备哪些材料' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '孕前优生健康检查要准备哪些材料');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '孕前优生健康检查资料有哪些' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '孕前优生健康检查资料有哪些');

-- 263. 计划生育 / 孕前优生健康检查可以网上办理吗
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '孕前优生健康检查可以网上办理吗', '孕前优生健康检查一般属于公共卫生和生育服务的一部分。现在很多地方都支持线上办，但不是所有地区、所有情形都一样。最稳的办法是先在国家政务服务平台生育服务专区、属地卫生健康部门或妇幼保健机构上搜索事项名称，能提交就直接线上办；如果页面提示要现场核验，再按提示去窗口，不用一开始就来回跑。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '孕前优生健康检查可以网上办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '孕前优生健康检查可以网上办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '孕前优生健康检查能网上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '孕前优生健康检查能网上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '孕前优生健康检查可以线上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '孕前优生健康检查可以线上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '孕前优生健康检查手机上能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '孕前优生健康检查手机上能办吗');

-- 264. 计划生育 / 孕前优生健康检查在哪里办理
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '孕前优生健康检查在哪里办理', '孕前优生健康检查一般属于公共卫生和生育服务的一部分。先别急着直接跑大厅，先在国家政务服务平台生育服务专区、属地卫生健康部门或妇幼保健机构查办理入口、受理机构和办公时间。能线上办的直接在线提交，必须现场办的，再去属地窗口。这样做最实际，能避免跑错地方或者排队后才发现材料不对。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '孕前优生健康检查在哪里办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '孕前优生健康检查在哪里办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '孕前优生健康检查去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '孕前优生健康检查去哪里办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '孕前优生健康检查在哪办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '孕前优生健康检查在哪办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '孕前优生健康检查在哪个窗口办理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '孕前优生健康检查在哪个窗口办理');

-- 265. 计划生育 / 孕前优生健康检查办理后多久生效
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '孕前优生健康检查办理后多久生效', '孕前优生健康检查一般属于公共卫生和生育服务的一部分。这个没有全国统一到“几天”的固定答案，通常要看你所在地区、材料是否齐全、系统能不能自动核验。对普通人来说，最关键不是死盯天数，而是先把信息一次填对、材料一次交齐，这样通常会快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '孕前优生健康检查办理后多久生效');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '孕前优生健康检查办理后多久生效' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '孕前优生健康检查多久能办好' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '孕前优生健康检查多久能办好');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '孕前优生健康检查多久生效' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '孕前优生健康检查多久生效');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '孕前优生健康检查一般要几天' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '孕前优生健康检查一般要几天');

-- 266. 计划生育 / 孕前优生健康检查如何查询进度
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '孕前优生健康检查如何查询进度', '孕前优生健康检查一般属于公共卫生和生育服务的一部分。如果你已经提交申请，通常先在国家政务服务平台生育服务专区、属地卫生健康部门或妇幼保健机构看有没有“我的办件”“办理进度”或查询入口。线上查不到时，再拿受理编号、身份证去窗口或打官方电话问。最有用的是把受理时间和编号先记下来，后面查起来快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '孕前优生健康检查如何查询进度');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '孕前优生健康检查如何查询进度' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '孕前优生健康检查进度怎么查' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '孕前优生健康检查进度怎么查');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '孕前优生健康检查审核到哪了' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '孕前优生健康检查审核到哪了');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么查孕前优生健康检查办理进度' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么查孕前优生健康检查办理进度');

-- 267. 计划生育 / 孕前优生健康检查需要满足什么条件
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '孕前优生健康检查需要满足什么条件', '孕前优生健康检查一般属于公共卫生和生育服务的一部分。先别急着准备材料，先看自己是不是符合基本条件。大多数人办不下来，不是不会操作，而是条件没对上。最稳的办法是先在国家政务服务平台生育服务专区、属地卫生健康部门或妇幼保健机构看适用对象、缴费要求、婚育情况或账户状态，再决定要不要申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '孕前优生健康检查需要满足什么条件');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '孕前优生健康检查需要满足什么条件' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '孕前优生健康检查要什么条件' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '孕前优生健康检查要什么条件');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '孕前优生健康检查申请条件是什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '孕前优生健康检查申请条件是什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '哪些人能办孕前优生健康检查' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '哪些人能办孕前优生健康检查');

-- 268. 计划生育 / 孕前优生健康检查能否代办
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '孕前优生健康检查能否代办', '孕前优生健康检查一般属于公共卫生和生育服务的一部分。很多事项不是完全不能代办，但代办时通常要多准备委托说明、双方身份证明或其他补充材料。你最好先在国家政务服务平台生育服务专区、属地卫生健康部门或妇幼保健机构查一下是否支持代办；如果本来就能本人线上办，通常自己操作会更快，也更不容易出错。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '孕前优生健康检查能否代办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '孕前优生健康检查能否代办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '孕前优生健康检查可以代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '孕前优生健康检查可以代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '孕前优生健康检查能找人代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '孕前优生健康检查能找人代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '孕前优生健康检查能委托别人办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '孕前优生健康检查能委托别人办吗');

-- 269. 计划生育 / 孕前优生健康检查异地可以办理吗
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '孕前优生健康检查异地可以办理吗', '孕前优生健康检查一般属于公共卫生和生育服务的一部分。现在不少事项已经支持异地办或跨省通办，但不是所有地方都完全打通。最实际的做法是先在国家政务服务平台生育服务专区、属地卫生健康部门或妇幼保健机构确认这个事项有没有异地入口；如果有就按流程在线提交，没有的话再问清楚是回原地办，还是在现居地先申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '孕前优生健康检查异地可以办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '孕前优生健康检查异地可以办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '孕前优生健康检查外地能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '孕前优生健康检查外地能办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '孕前优生健康检查异地怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '孕前优生健康检查异地怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '孕前优生健康检查跨省能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '孕前优生健康检查跨省能办吗');

-- 270. 计划生育 / 孕前优生健康检查办理失败怎么办
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '孕前优生健康检查办理失败怎么办', '孕前优生健康检查一般属于公共卫生和生育服务的一部分。别一被退回就重新乱提交，先看清楚退回原因。大多数情况无非是条件不符、材料不全、信息填错或系统核验不过。先把退回提示逐项改掉，再重新提交；如果提示看不懂，就直接找国家政务服务平台生育服务专区、属地卫生健康部门或妇幼保健机构对应的官方窗口或服务热线问清楚。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '孕前优生健康检查办理失败怎么办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '孕前优生健康检查办理失败怎么办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '孕前优生健康检查办不下来怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '孕前优生健康检查办不下来怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '孕前优生健康检查被退回怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '孕前优生健康检查被退回怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '孕前优生健康检查申请失败怎么处理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '孕前优生健康检查申请失败怎么处理');

-- 271. 计划生育 / 孕检机构查询如何办理
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '孕检机构查询如何办理', '想找正规孕检机构，先查官方公开渠道更稳。最方便的做法是先在国家政务服务平台全国孕检机构查询服务或属地卫生健康部门官网上搜这个事项，看能不能直接线上办。能线上提交的，就按页面一步步填信息、传材料；线上办不了的，再带身份证和相关材料去窗口。先查入口再出门，通常能少跑一趟。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '孕检机构查询如何办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '孕检机构查询如何办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '孕检机构查询怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '孕检机构查询怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么办理孕检机构查询' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么办理孕检机构查询');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '孕检机构查询去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '孕检机构查询去哪里办');

-- 272. 计划生育 / 孕检机构查询需要什么材料
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '孕检机构查询需要什么材料', '想找正规孕检机构，先查官方公开渠道更稳。一般先准备身份证，另外再按事项准备对应证明材料。很多人容易一上来准备一大堆，其实没必要，先去国家政务服务平台全国孕检机构查询服务或属地卫生健康部门官网看清单最省事；能系统核验的材料通常不用重复提交，页面提示缺什么再补什么。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '孕检机构查询需要什么材料');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '孕检机构查询需要什么材料' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '孕检机构查询要带什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '孕检机构查询要带什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '孕检机构查询要准备哪些材料' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '孕检机构查询要准备哪些材料');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '孕检机构查询资料有哪些' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '孕检机构查询资料有哪些');

-- 273. 计划生育 / 孕检机构查询可以网上办理吗
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '孕检机构查询可以网上办理吗', '想找正规孕检机构，先查官方公开渠道更稳。现在很多地方都支持线上办，但不是所有地区、所有情形都一样。最稳的办法是先在国家政务服务平台全国孕检机构查询服务或属地卫生健康部门官网上搜索事项名称，能提交就直接线上办；如果页面提示要现场核验，再按提示去窗口，不用一开始就来回跑。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '孕检机构查询可以网上办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '孕检机构查询可以网上办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '孕检机构查询能网上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '孕检机构查询能网上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '孕检机构查询可以线上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '孕检机构查询可以线上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '孕检机构查询手机上能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '孕检机构查询手机上能办吗');

-- 274. 计划生育 / 孕检机构查询在哪里办理
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '孕检机构查询在哪里办理', '想找正规孕检机构，先查官方公开渠道更稳。先别急着直接跑大厅，先在国家政务服务平台全国孕检机构查询服务或属地卫生健康部门官网查办理入口、受理机构和办公时间。能线上办的直接在线提交，必须现场办的，再去属地窗口。这样做最实际，能避免跑错地方或者排队后才发现材料不对。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '孕检机构查询在哪里办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '孕检机构查询在哪里办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '孕检机构查询去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '孕检机构查询去哪里办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '孕检机构查询在哪办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '孕检机构查询在哪办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '孕检机构查询在哪个窗口办理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '孕检机构查询在哪个窗口办理');

-- 275. 计划生育 / 孕检机构查询办理后多久生效
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '孕检机构查询办理后多久生效', '想找正规孕检机构，先查官方公开渠道更稳。这个没有全国统一到“几天”的固定答案，通常要看你所在地区、材料是否齐全、系统能不能自动核验。对普通人来说，最关键不是死盯天数，而是先把信息一次填对、材料一次交齐，这样通常会快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '孕检机构查询办理后多久生效');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '孕检机构查询办理后多久生效' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '孕检机构查询多久能办好' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '孕检机构查询多久能办好');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '孕检机构查询多久生效' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '孕检机构查询多久生效');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '孕检机构查询一般要几天' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '孕检机构查询一般要几天');

-- 276. 计划生育 / 孕检机构查询如何查询进度
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '孕检机构查询如何查询进度', '想找正规孕检机构，先查官方公开渠道更稳。如果你已经提交申请，通常先在国家政务服务平台全国孕检机构查询服务或属地卫生健康部门官网看有没有“我的办件”“办理进度”或查询入口。线上查不到时，再拿受理编号、身份证去窗口或打官方电话问。最有用的是把受理时间和编号先记下来，后面查起来快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '孕检机构查询如何查询进度');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '孕检机构查询如何查询进度' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '孕检机构查询进度怎么查' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '孕检机构查询进度怎么查');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '孕检机构查询审核到哪了' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '孕检机构查询审核到哪了');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么查孕检机构查询办理进度' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么查孕检机构查询办理进度');

-- 277. 计划生育 / 孕检机构查询需要满足什么条件
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '孕检机构查询需要满足什么条件', '想找正规孕检机构，先查官方公开渠道更稳。先别急着准备材料，先看自己是不是符合基本条件。大多数人办不下来，不是不会操作，而是条件没对上。最稳的办法是先在国家政务服务平台全国孕检机构查询服务或属地卫生健康部门官网看适用对象、缴费要求、婚育情况或账户状态，再决定要不要申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '孕检机构查询需要满足什么条件');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '孕检机构查询需要满足什么条件' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '孕检机构查询要什么条件' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '孕检机构查询要什么条件');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '孕检机构查询申请条件是什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '孕检机构查询申请条件是什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '哪些人能办孕检机构查询' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '哪些人能办孕检机构查询');

-- 278. 计划生育 / 孕检机构查询能否代办
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '孕检机构查询能否代办', '想找正规孕检机构，先查官方公开渠道更稳。很多事项不是完全不能代办，但代办时通常要多准备委托说明、双方身份证明或其他补充材料。你最好先在国家政务服务平台全国孕检机构查询服务或属地卫生健康部门官网查一下是否支持代办；如果本来就能本人线上办，通常自己操作会更快，也更不容易出错。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '孕检机构查询能否代办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '孕检机构查询能否代办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '孕检机构查询可以代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '孕检机构查询可以代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '孕检机构查询能找人代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '孕检机构查询能找人代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '孕检机构查询能委托别人办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '孕检机构查询能委托别人办吗');

-- 279. 计划生育 / 孕检机构查询异地可以办理吗
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '孕检机构查询异地可以办理吗', '想找正规孕检机构，先查官方公开渠道更稳。现在不少事项已经支持异地办或跨省通办，但不是所有地方都完全打通。最实际的做法是先在国家政务服务平台全国孕检机构查询服务或属地卫生健康部门官网确认这个事项有没有异地入口；如果有就按流程在线提交，没有的话再问清楚是回原地办，还是在现居地先申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '孕检机构查询异地可以办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '孕检机构查询异地可以办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '孕检机构查询外地能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '孕检机构查询外地能办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '孕检机构查询异地怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '孕检机构查询异地怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '孕检机构查询跨省能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '孕检机构查询跨省能办吗');

-- 280. 计划生育 / 孕检机构查询办理失败怎么办
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '孕检机构查询办理失败怎么办', '想找正规孕检机构，先查官方公开渠道更稳。别一被退回就重新乱提交，先看清楚退回原因。大多数情况无非是条件不符、材料不全、信息填错或系统核验不过。先把退回提示逐项改掉，再重新提交；如果提示看不懂，就直接找国家政务服务平台全国孕检机构查询服务或属地卫生健康部门官网对应的官方窗口或服务热线问清楚。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '孕检机构查询办理失败怎么办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '孕检机构查询办理失败怎么办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '孕检机构查询办不下来怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '孕检机构查询办不下来怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '孕检机构查询被退回怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '孕检机构查询被退回怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '孕检机构查询申请失败怎么处理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '孕检机构查询申请失败怎么处理');

-- 281. 计划生育 / 再生育相关手续如何办理
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '再生育相关手续如何办理', '涉及再生育相关手续时，先确认自己属于哪种具体情形。最方便的做法是先在国家政务服务平台生育服务专区、属地卫生健康部门政务服务网或线下窗口上搜这个事项，看能不能直接线上办。能线上提交的，就按页面一步步填信息、传材料；线上办不了的，再带身份证和相关材料去窗口。先查入口再出门，通常能少跑一趟。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '再生育相关手续如何办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '再生育相关手续如何办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '再生育相关手续怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '再生育相关手续怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么办理再生育相关手续' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么办理再生育相关手续');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '再生育相关手续去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '再生育相关手续去哪里办');

-- 282. 计划生育 / 再生育相关手续需要什么材料
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '再生育相关手续需要什么材料', '涉及再生育相关手续时，先确认自己属于哪种具体情形。一般先准备身份证，另外再按事项准备对应证明材料。很多人容易一上来准备一大堆，其实没必要，先去国家政务服务平台生育服务专区、属地卫生健康部门政务服务网或线下窗口看清单最省事；能系统核验的材料通常不用重复提交，页面提示缺什么再补什么。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '再生育相关手续需要什么材料');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '再生育相关手续需要什么材料' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '再生育相关手续要带什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '再生育相关手续要带什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '再生育相关手续要准备哪些材料' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '再生育相关手续要准备哪些材料');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '再生育相关手续资料有哪些' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '再生育相关手续资料有哪些');

-- 283. 计划生育 / 再生育相关手续可以网上办理吗
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '再生育相关手续可以网上办理吗', '涉及再生育相关手续时，先确认自己属于哪种具体情形。现在很多地方都支持线上办，但不是所有地区、所有情形都一样。最稳的办法是先在国家政务服务平台生育服务专区、属地卫生健康部门政务服务网或线下窗口上搜索事项名称，能提交就直接线上办；如果页面提示要现场核验，再按提示去窗口，不用一开始就来回跑。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '再生育相关手续可以网上办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '再生育相关手续可以网上办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '再生育相关手续能网上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '再生育相关手续能网上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '再生育相关手续可以线上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '再生育相关手续可以线上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '再生育相关手续手机上能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '再生育相关手续手机上能办吗');

-- 284. 计划生育 / 再生育相关手续在哪里办理
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '再生育相关手续在哪里办理', '涉及再生育相关手续时，先确认自己属于哪种具体情形。先别急着直接跑大厅，先在国家政务服务平台生育服务专区、属地卫生健康部门政务服务网或线下窗口查办理入口、受理机构和办公时间。能线上办的直接在线提交，必须现场办的，再去属地窗口。这样做最实际，能避免跑错地方或者排队后才发现材料不对。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '再生育相关手续在哪里办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '再生育相关手续在哪里办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '再生育相关手续去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '再生育相关手续去哪里办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '再生育相关手续在哪办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '再生育相关手续在哪办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '再生育相关手续在哪个窗口办理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '再生育相关手续在哪个窗口办理');

-- 285. 计划生育 / 再生育相关手续办理后多久生效
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '再生育相关手续办理后多久生效', '涉及再生育相关手续时，先确认自己属于哪种具体情形。这个没有全国统一到“几天”的固定答案，通常要看你所在地区、材料是否齐全、系统能不能自动核验。对普通人来说，最关键不是死盯天数，而是先把信息一次填对、材料一次交齐，这样通常会快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '再生育相关手续办理后多久生效');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '再生育相关手续办理后多久生效' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '再生育相关手续多久能办好' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '再生育相关手续多久能办好');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '再生育相关手续多久生效' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '再生育相关手续多久生效');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '再生育相关手续一般要几天' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '再生育相关手续一般要几天');

-- 286. 计划生育 / 再生育相关手续如何查询进度
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '再生育相关手续如何查询进度', '涉及再生育相关手续时，先确认自己属于哪种具体情形。如果你已经提交申请，通常先在国家政务服务平台生育服务专区、属地卫生健康部门政务服务网或线下窗口看有没有“我的办件”“办理进度”或查询入口。线上查不到时，再拿受理编号、身份证去窗口或打官方电话问。最有用的是把受理时间和编号先记下来，后面查起来快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '再生育相关手续如何查询进度');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '再生育相关手续如何查询进度' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '再生育相关手续进度怎么查' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '再生育相关手续进度怎么查');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '再生育相关手续审核到哪了' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '再生育相关手续审核到哪了');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么查再生育相关手续办理进度' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么查再生育相关手续办理进度');

-- 287. 计划生育 / 再生育相关手续需要满足什么条件
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '再生育相关手续需要满足什么条件', '涉及再生育相关手续时，先确认自己属于哪种具体情形。先别急着准备材料，先看自己是不是符合基本条件。大多数人办不下来，不是不会操作，而是条件没对上。最稳的办法是先在国家政务服务平台生育服务专区、属地卫生健康部门政务服务网或线下窗口看适用对象、缴费要求、婚育情况或账户状态，再决定要不要申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '再生育相关手续需要满足什么条件');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '再生育相关手续需要满足什么条件' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '再生育相关手续要什么条件' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '再生育相关手续要什么条件');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '再生育相关手续申请条件是什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '再生育相关手续申请条件是什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '哪些人能办再生育相关手续' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '哪些人能办再生育相关手续');

-- 288. 计划生育 / 再生育相关手续能否代办
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '再生育相关手续能否代办', '涉及再生育相关手续时，先确认自己属于哪种具体情形。很多事项不是完全不能代办，但代办时通常要多准备委托说明、双方身份证明或其他补充材料。你最好先在国家政务服务平台生育服务专区、属地卫生健康部门政务服务网或线下窗口查一下是否支持代办；如果本来就能本人线上办，通常自己操作会更快，也更不容易出错。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '再生育相关手续能否代办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '再生育相关手续能否代办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '再生育相关手续可以代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '再生育相关手续可以代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '再生育相关手续能找人代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '再生育相关手续能找人代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '再生育相关手续能委托别人办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '再生育相关手续能委托别人办吗');

-- 289. 计划生育 / 再生育相关手续异地可以办理吗
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '再生育相关手续异地可以办理吗', '涉及再生育相关手续时，先确认自己属于哪种具体情形。现在不少事项已经支持异地办或跨省通办，但不是所有地方都完全打通。最实际的做法是先在国家政务服务平台生育服务专区、属地卫生健康部门政务服务网或线下窗口确认这个事项有没有异地入口；如果有就按流程在线提交，没有的话再问清楚是回原地办，还是在现居地先申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '再生育相关手续异地可以办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '再生育相关手续异地可以办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '再生育相关手续外地能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '再生育相关手续外地能办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '再生育相关手续异地怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '再生育相关手续异地怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '再生育相关手续跨省能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '再生育相关手续跨省能办吗');

-- 290. 计划生育 / 再生育相关手续办理失败怎么办
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '再生育相关手续办理失败怎么办', '涉及再生育相关手续时，先确认自己属于哪种具体情形。别一被退回就重新乱提交，先看清楚退回原因。大多数情况无非是条件不符、材料不全、信息填错或系统核验不过。先把退回提示逐项改掉，再重新提交；如果提示看不懂，就直接找国家政务服务平台生育服务专区、属地卫生健康部门政务服务网或线下窗口对应的官方窗口或服务热线问清楚。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '再生育相关手续办理失败怎么办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '再生育相关手续办理失败怎么办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '再生育相关手续办不下来怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '再生育相关手续办不下来怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '再生育相关手续被退回怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '再生育相关手续被退回怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '再生育相关手续申请失败怎么处理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '再生育相关手续申请失败怎么处理');

-- 291. 计划生育 / 计划生育家庭特别扶助申请如何办理
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '计划生育家庭特别扶助申请如何办理', '计划生育家庭特别扶助一般要按年度或批次集中申请。最方便的做法是先在属地卫生健康部门、街道乡镇受理窗口及政府官网公开办事指南上搜这个事项，看能不能直接线上办。能线上提交的，就按页面一步步填信息、传材料；线上办不了的，再带身份证和相关材料去窗口。先查入口再出门，通常能少跑一趟。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '计划生育家庭特别扶助申请如何办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '计划生育家庭特别扶助申请如何办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '计划生育家庭特别扶助申请怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '计划生育家庭特别扶助申请怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么办理计划生育家庭特别扶助申请' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么办理计划生育家庭特别扶助申请');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '计划生育家庭特别扶助申请去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '计划生育家庭特别扶助申请去哪里办');

-- 292. 计划生育 / 计划生育家庭特别扶助申请需要什么材料
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '计划生育家庭特别扶助申请需要什么材料', '计划生育家庭特别扶助一般要按年度或批次集中申请。一般先准备身份证，另外再按事项准备对应证明材料。很多人容易一上来准备一大堆，其实没必要，先去属地卫生健康部门、街道乡镇受理窗口及政府官网公开办事指南看清单最省事；能系统核验的材料通常不用重复提交，页面提示缺什么再补什么。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '计划生育家庭特别扶助申请需要什么材料');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '计划生育家庭特别扶助申请需要什么材料' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '计划生育家庭特别扶助申请要带什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '计划生育家庭特别扶助申请要带什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '计划生育家庭特别扶助申请要准备哪些材料' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '计划生育家庭特别扶助申请要准备哪些材料');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '计划生育家庭特别扶助申请资料有哪些' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '计划生育家庭特别扶助申请资料有哪些');

-- 293. 计划生育 / 计划生育家庭特别扶助申请可以网上办理吗
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '计划生育家庭特别扶助申请可以网上办理吗', '计划生育家庭特别扶助一般要按年度或批次集中申请。现在很多地方都支持线上办，但不是所有地区、所有情形都一样。最稳的办法是先在属地卫生健康部门、街道乡镇受理窗口及政府官网公开办事指南上搜索事项名称，能提交就直接线上办；如果页面提示要现场核验，再按提示去窗口，不用一开始就来回跑。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '计划生育家庭特别扶助申请可以网上办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '计划生育家庭特别扶助申请可以网上办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '计划生育家庭特别扶助申请能网上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '计划生育家庭特别扶助申请能网上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '计划生育家庭特别扶助申请可以线上办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '计划生育家庭特别扶助申请可以线上办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '计划生育家庭特别扶助申请手机上能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '计划生育家庭特别扶助申请手机上能办吗');

-- 294. 计划生育 / 计划生育家庭特别扶助申请在哪里办理
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '计划生育家庭特别扶助申请在哪里办理', '计划生育家庭特别扶助一般要按年度或批次集中申请。先别急着直接跑大厅，先在属地卫生健康部门、街道乡镇受理窗口及政府官网公开办事指南查办理入口、受理机构和办公时间。能线上办的直接在线提交，必须现场办的，再去属地窗口。这样做最实际，能避免跑错地方或者排队后才发现材料不对。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '计划生育家庭特别扶助申请在哪里办理');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '计划生育家庭特别扶助申请在哪里办理' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '计划生育家庭特别扶助申请去哪里办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '计划生育家庭特别扶助申请去哪里办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '计划生育家庭特别扶助申请在哪办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '计划生育家庭特别扶助申请在哪办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '计划生育家庭特别扶助申请在哪个窗口办理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '计划生育家庭特别扶助申请在哪个窗口办理');

-- 295. 计划生育 / 计划生育家庭特别扶助申请办理后多久生效
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '计划生育家庭特别扶助申请办理后多久生效', '计划生育家庭特别扶助一般要按年度或批次集中申请。这个没有全国统一到“几天”的固定答案，通常要看你所在地区、材料是否齐全、系统能不能自动核验。对普通人来说，最关键不是死盯天数，而是先把信息一次填对、材料一次交齐，这样通常会快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '计划生育家庭特别扶助申请办理后多久生效');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '计划生育家庭特别扶助申请办理后多久生效' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '计划生育家庭特别扶助申请多久能办好' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '计划生育家庭特别扶助申请多久能办好');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '计划生育家庭特别扶助申请多久生效' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '计划生育家庭特别扶助申请多久生效');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '计划生育家庭特别扶助申请一般要几天' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '计划生育家庭特别扶助申请一般要几天');

-- 296. 计划生育 / 计划生育家庭特别扶助申请如何查询进度
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '计划生育家庭特别扶助申请如何查询进度', '计划生育家庭特别扶助一般要按年度或批次集中申请。如果你已经提交申请，通常先在属地卫生健康部门、街道乡镇受理窗口及政府官网公开办事指南看有没有“我的办件”“办理进度”或查询入口。线上查不到时，再拿受理编号、身份证去窗口或打官方电话问。最有用的是把受理时间和编号先记下来，后面查起来快很多。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '计划生育家庭特别扶助申请如何查询进度');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '计划生育家庭特别扶助申请如何查询进度' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '计划生育家庭特别扶助申请进度怎么查' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '计划生育家庭特别扶助申请进度怎么查');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '计划生育家庭特别扶助申请审核到哪了' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '计划生育家庭特别扶助申请审核到哪了');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '怎么查计划生育家庭特别扶助申请办理进度' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '怎么查计划生育家庭特别扶助申请办理进度');

-- 297. 计划生育 / 计划生育家庭特别扶助申请需要满足什么条件
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '计划生育家庭特别扶助申请需要满足什么条件', '计划生育家庭特别扶助一般要按年度或批次集中申请。先别急着准备材料，先看自己是不是符合基本条件。大多数人办不下来，不是不会操作，而是条件没对上。最稳的办法是先在属地卫生健康部门、街道乡镇受理窗口及政府官网公开办事指南看适用对象、缴费要求、婚育情况或账户状态，再决定要不要申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '计划生育家庭特别扶助申请需要满足什么条件');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '计划生育家庭特别扶助申请需要满足什么条件' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '计划生育家庭特别扶助申请要什么条件' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '计划生育家庭特别扶助申请要什么条件');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '计划生育家庭特别扶助申请申请条件是什么' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '计划生育家庭特别扶助申请申请条件是什么');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '哪些人能办计划生育家庭特别扶助申请' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '哪些人能办计划生育家庭特别扶助申请');

-- 298. 计划生育 / 计划生育家庭特别扶助申请能否代办
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '计划生育家庭特别扶助申请能否代办', '计划生育家庭特别扶助一般要按年度或批次集中申请。很多事项不是完全不能代办，但代办时通常要多准备委托说明、双方身份证明或其他补充材料。你最好先在属地卫生健康部门、街道乡镇受理窗口及政府官网公开办事指南查一下是否支持代办；如果本来就能本人线上办，通常自己操作会更快，也更不容易出错。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '计划生育家庭特别扶助申请能否代办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '计划生育家庭特别扶助申请能否代办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '计划生育家庭特别扶助申请可以代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '计划生育家庭特别扶助申请可以代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '计划生育家庭特别扶助申请能找人代办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '计划生育家庭特别扶助申请能找人代办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '计划生育家庭特别扶助申请能委托别人办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '计划生育家庭特别扶助申请能委托别人办吗');

-- 299. 计划生育 / 计划生育家庭特别扶助申请异地可以办理吗
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '计划生育家庭特别扶助申请异地可以办理吗', '计划生育家庭特别扶助一般要按年度或批次集中申请。现在不少事项已经支持异地办或跨省通办，但不是所有地方都完全打通。最实际的做法是先在属地卫生健康部门、街道乡镇受理窗口及政府官网公开办事指南确认这个事项有没有异地入口；如果有就按流程在线提交，没有的话再问清楚是回原地办，还是在现居地先申请。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '计划生育家庭特别扶助申请异地可以办理吗');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '计划生育家庭特别扶助申请异地可以办理吗' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '计划生育家庭特别扶助申请外地能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '计划生育家庭特别扶助申请外地能办吗');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '计划生育家庭特别扶助申请异地怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '计划生育家庭特别扶助申请异地怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '计划生育家庭特别扶助申请跨省能办吗' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '计划生育家庭特别扶助申请跨省能办吗');

-- 300. 计划生育 / 计划生育家庭特别扶助申请办理失败怎么办
SET @category_id := (SELECT id FROM category WHERE name = '计划生育' ORDER BY id LIMIT 1);
INSERT INTO faq (category_id, standard_question, standard_answer, status) SELECT @category_id, '计划生育家庭特别扶助申请办理失败怎么办', '计划生育家庭特别扶助一般要按年度或批次集中申请。别一被退回就重新乱提交，先看清楚退回原因。大多数情况无非是条件不符、材料不全、信息填错或系统核验不过。先把退回提示逐项改掉，再重新提交；如果提示看不懂，就直接找属地卫生健康部门、街道乡镇受理窗口及政府官网公开办事指南对应的官方窗口或服务热线问清楚。', 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM faq WHERE category_id = @category_id AND standard_question = '计划生育家庭特别扶助申请办理失败怎么办');
SET @faq_id := (SELECT id FROM faq WHERE category_id = @category_id AND standard_question = '计划生育家庭特别扶助申请办理失败怎么办' ORDER BY id LIMIT 1);
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '计划生育家庭特别扶助申请办不下来怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '计划生育家庭特别扶助申请办不下来怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '计划生育家庭特别扶助申请被退回怎么办' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '计划生育家庭特别扶助申请被退回怎么办');
INSERT INTO faq_alias (faq_id, alias_question) SELECT @faq_id, '计划生育家庭特别扶助申请申请失败怎么处理' FROM DUAL WHERE @faq_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM faq_alias WHERE faq_id = @faq_id AND alias_question = '计划生育家庭特别扶助申请申请失败怎么处理');

COMMIT;

-- FAQ rows in source: 300
-- Alias rows in source: 900

// =====================================================
// 知识图谱初始数据 - 高频政务事项
// 执行方式：通过 Neo4j Browser 或 cypher-shell 导入
//   cat init-graph-data.cypher | cypher-shell -u neo4j -p 12345678
// 预期：15 个事项节点，约 80+ 关系
// =====================================================

// ─────────────────────────────────────────────────────
// 1. 材料节点 (Material)
// ─────────────────────────────────────────────────────
CREATE (m1:Material {bizId:'material_001', name:'身份证', type:'Material', summary:'居民身份证原件或有效电子证照', status:1, source:'manual', aliases:['身份证件','身份证明'], required:true, formatRequirement:'原件或有效电子证照', createdAt:datetime(), updatedAt:datetime()});
CREATE (m2:Material {bizId:'material_002', name:'户口本', type:'Material', summary:'居民户口簿原件', status:1, source:'manual', aliases:['户口簿'], required:true, formatRequirement:'原件', createdAt:datetime(), updatedAt:datetime()});
CREATE (m3:Material {bizId:'material_003', name:'社保卡', type:'Material', summary:'中华人民共和国社会保障卡', status:1, source:'manual', aliases:['社保医保卡','市民卡'], required:true, formatRequirement:'实体卡或电子社保卡', createdAt:datetime(), updatedAt:datetime()});
CREATE (m4:Material {bizId:'material_004', name:'劳动合同', type:'Material', summary:'与用人单位签订的劳动合同', status:1, source:'manual', aliases:['用工合同'], required:false, formatRequirement:'复印件', createdAt:datetime(), updatedAt:datetime()});
CREATE (m5:Material {bizId:'material_005', name:'银行卡', type:'Material', summary:'本人名下银行借记卡', status:1, source:'manual', aliases:['储蓄卡','借记卡'], required:true, formatRequirement:'一类卡', createdAt:datetime(), updatedAt:datetime()});
CREATE (m6:Material {bizId:'material_006', name:'结婚证', type:'Material', summary:'结婚登记证', status:1, source:'manual', aliases:['婚姻证明'], required:false, formatRequirement:'原件', createdAt:datetime(), updatedAt:datetime()});
CREATE (m7:Material {bizId:'material_007', name:'出生医学证明', type:'Material', summary:'出生医学证明原件', status:1, source:'manual', aliases:['出生证','出生证明'], required:false, formatRequirement:'原件', createdAt:datetime(), updatedAt:datetime()});
CREATE (m8:Material {bizId:'material_008', name:'居住证', type:'Material', summary:'居住证原件', status:1, source:'manual', aliases:['暂住证'], required:false, formatRequirement:'原件', createdAt:datetime(), updatedAt:datetime()});
CREATE (m9:Material {bizId:'material_009', name:'公积金联名卡', type:'Material', summary:'住房公积金联名卡', status:1, source:'manual', aliases:['公积金卡'], required:true, formatRequirement:'实体卡', createdAt:datetime(), updatedAt:datetime()});
CREATE (m10:Material {bizId:'material_010', name:'离职证明', type:'Material', summary:'原单位出具的离职证明', status:1, source:'manual', aliases:['解除劳动关系证明'], required:false, formatRequirement:'原件', createdAt:datetime(), updatedAt:datetime()});

// ─────────────────────────────────────────────────────
// 2. 条件节点 (Condition)
// ─────────────────────────────────────────────────────
CREATE (c1:Condition {bizId:'condition_001', name:'在职且正常缴费', type:'Condition', summary:'与用人单位存在劳动关系且社保正常缴纳', status:1, source:'manual', aliases:['正常参保'], conditionType:'缴费状态', judgeRule:'近6个月有连续缴费记录', createdAt:datetime(), updatedAt:datetime()});
CREATE (c2:Condition {bizId:'condition_002', name:'连续缴存满6个月', type:'Condition', summary:'住房公积金连续缴存满6个月', status:1, source:'manual', aliases:['缴存6个月'], conditionType:'缴存时限', judgeRule:'开户后连续正常缴存6个月（含）以上', createdAt:datetime(), updatedAt:datetime()});
CREATE (c3:Condition {bizId:'condition_003', name:'退休或达到法定退休年龄', type:'Condition', summary:'已办理退休手续或达到法定退休年龄', status:1, source:'manual', aliases:['已退休'], conditionType:'身份状态', judgeRule:'男60周岁、女55/50周岁', createdAt:datetime(), updatedAt:datetime()});
CREATE (c4:Condition {bizId:'condition_004', name:'非本市户籍离职', type:'Condition', summary:'非本市户籍且已与原单位解除劳动关系', status:1, source:'manual', aliases:['外地户口离职'], conditionType:'户籍与就业', judgeRule:'户籍所在地非当前城市', createdAt:datetime(), updatedAt:datetime()});
CREATE (c5:Condition {bizId:'condition_005', name:'购房或还贷', type:'Condition', summary:'购买自住住房或偿还住房贷款', status:1, source:'manual', aliases:['买房','还房贷'], conditionType:'用途', judgeRule:'提供购房合同或贷款合同', createdAt:datetime(), updatedAt:datetime()});
CREATE (c6:Condition {bizId:'condition_006', name:'租房且无自有住房', type:'Condition', summary:'在工作地租房居住且名下无自有住房', status:1, source:'manual', aliases:['租房提取'], conditionType:'用途', judgeRule:'提供租房合同或无房证明', createdAt:datetime(), updatedAt:datetime()});
CREATE (c7:Condition {bizId:'condition_007', name:'符合计划生育政策', type:'Condition', summary:'符合国家及地方计划生育政策规定', status:1, source:'manual', aliases:['符合计生政策'], conditionType:'政策合规', judgeRule:'依法登记结婚并符合生育政策', createdAt:datetime(), updatedAt:datetime()});

// ─────────────────────────────────────────────────────
// 3. 渠道节点 (Channel)
// ─────────────────────────────────────────────────────
CREATE (ch1:Channel {bizId:'channel_001', name:'政务服务网', type:'Channel', summary:'当地政务服务在线平台', status:1, source:'manual', aliases:['网上办事','线上办理'], channelType:'线上', onlineUrl:'https://zwfw.example.gov.cn', createdAt:datetime(), updatedAt:datetime()});
CREATE (ch2:Channel {bizId:'channel_002', name:'政务服务大厅', type:'Channel', summary:'线下政务服务中心窗口', status:1, source:'manual', aliases:['办事大厅','政务中心','市民中心'], channelType:'线下', address:'当地政务服务中心', createdAt:datetime(), updatedAt:datetime()});
CREATE (ch3:Channel {bizId:'channel_003', name:'手机APP', type:'Channel', summary:'政务服务移动端应用', status:1, source:'manual', aliases:['APP办理','掌上办','移动端'], channelType:'线上', onlineUrl:'各大应用市场搜索"政务服务"', createdAt:datetime(), updatedAt:datetime()});
CREATE (ch4:Channel {bizId:'channel_004', name:'自助终端', type:'Channel', summary:'部署在社区/银行的自助服务终端', status:1, source:'manual', aliases:['自助机','自助办理'], channelType:'线下', address:'社区服务中心、合作银行网点', createdAt:datetime(), updatedAt:datetime()});

// ─────────────────────────────────────────────────────
// 4. 部门节点 (Department)
// ─────────────────────────────────────────────────────
CREATE (d1:Department {bizId:'dept_001', name:'人力资源和社会保障局', type:'Department', summary:'负责社会保险、就业服务等', status:1, source:'manual', aliases:['人社局','社保局'], departmentCode:'RSJ', contactPhone:'12333', createdAt:datetime(), updatedAt:datetime()});
CREATE (d2:Department {bizId:'dept_002', name:'住房公积金管理中心', type:'Department', summary:'负责住房公积金归集、提取、贷款', status:1, source:'manual', aliases:['公积金中心','公积金管理局'], departmentCode:'GJJ', contactPhone:'12329', createdAt:datetime(), updatedAt:datetime()});
CREATE (d3:Department {bizId:'dept_003', name:'卫生健康委员会', type:'Department', summary:'负责计划生育、母婴保健等', status:1, source:'manual', aliases:['卫健委','卫生局'], departmentCode:'WJW', contactPhone:'12320', createdAt:datetime(), updatedAt:datetime()});
CREATE (d4:Department {bizId:'dept_004', name:'民政局', type:'Department', summary:'负责婚姻登记、社会救助等', status:1, source:'manual', aliases:['民政部门'], departmentCode:'MZJ', contactPhone:'12345', createdAt:datetime(), updatedAt:datetime()});

// ─────────────────────────────────────────────────────
// 5. 政策节点 (Policy)
// ─────────────────────────────────────────────────────
CREATE (p1:Policy {bizId:'policy_001', name:'社会保险法', type:'Policy', summary:'中华人民共和国社会保险法', status:1, source:'manual', aliases:['社保法'], policyNo:'主席令第35号', publishOrg:'全国人大常委会', effectiveDate:'2011-07-01', createdAt:datetime(), updatedAt:datetime()});
CREATE (p2:Policy {bizId:'policy_002', name:'住房公积金管理条例', type:'Policy', summary:'国务院关于修改《住房公积金管理条例》的决定', status:1, source:'manual', aliases:['公积金条例'], policyNo:'国务院令第350号', publishOrg:'国务院', effectiveDate:'2002-03-24', createdAt:datetime(), updatedAt:datetime()});
CREATE (p3:Policy {bizId:'policy_003', name:'人口与计划生育法', type:'Policy', summary:'中华人民共和国人口与计划生育法', status:1, source:'manual', aliases:['计生法'], policyNo:'主席令第63号', publishOrg:'全国人大常委会', effectiveDate:'2002-09-01', createdAt:datetime(), updatedAt:datetime()});

// ─────────────────────────────────────────────────────
// 6. 适用人群节点 (PersonType)
// ─────────────────────────────────────────────────────
CREATE (pt1:PersonType {bizId:'person_001', name:'在职职工', type:'PersonType', summary:'与用人单位建立劳动关系的劳动者', status:1, source:'manual', aliases:['单位职工','在职人员'], createdAt:datetime(), updatedAt:datetime()});
CREATE (pt2:PersonType {bizId:'person_002', name:'灵活就业人员', type:'PersonType', summary:'无固定用人单位的自主就业人员', status:1, source:'manual', aliases:['自由职业者','个体户'], createdAt:datetime(), updatedAt:datetime()});
CREATE (pt3:PersonType {bizId:'person_003', name:'退休人员', type:'PersonType', summary:'已办理退休手续的人员', status:1, source:'manual', aliases:['离退休人员'], createdAt:datetime(), updatedAt:datetime()});

// ─────────────────────────────────────────────────────
// 7. 办理结果节点 (Outcome)
// ─────────────────────────────────────────────────────
CREATE (o1:Outcome {bizId:'outcome_001', name:'社保待遇发放', type:'Outcome', summary:'养老金/医疗报销等社保待遇按月发放', status:1, source:'manual', aliases:['待遇到账'], createdAt:datetime(), updatedAt:datetime()});
CREATE (o2:Outcome {bizId:'outcome_002', name:'公积金到账', type:'Outcome', summary:'提取金额转入指定银行卡', status:1, source:'manual', aliases:['提取到账','资金到账'], createdAt:datetime(), updatedAt:datetime()});
CREATE (o3:Outcome {bizId:'outcome_003', name:'生育津贴发放', type:'Outcome', summary:'生育保险津贴发放至单位或个人', status:1, source:'manual', aliases:['生育报销','产假津贴'], createdAt:datetime(), updatedAt:datetime()});

// ─────────────────────────────────────────────────────
// 8. 事项节点 (Matter) - 15个高频事项
// ─────────────────────────────────────────────────────
CREATE (mt1:Matter {bizId:'matter_001', name:'社保卡申领', type:'Matter', summary:'首次申请或补换社会保障卡', status:1, source:'manual', aliases:['办社保卡','领社保卡','社保卡办理'], matterCode:'SB-KL-001', serviceMode:'线上+线下', timeLimit:'15个工作日', frequency:'高', createdAt:datetime(), updatedAt:datetime()});

CREATE (mt2:Matter {bizId:'matter_002', name:'社保转移接续', type:'Matter', summary:'跨统筹地区流动就业时社保关系转移', status:1, source:'manual', aliases:['社保转移','转移社保','社保跨省转移'], matterCode:'SB-ZY-001', serviceMode:'线上', timeLimit:'45个工作日', frequency:'中', createdAt:datetime(), updatedAt:datetime()});

CREATE (mt3:Matter {bizId:'matter_003', name:'养老金申领', type:'Matter', summary:'达到退休条件后申请按月领取基本养老金', status:1, source:'manual', aliases:['领养老金','退休金','养老保险待遇'], matterCode:'SB-YL-001', serviceMode:'线上+线下', timeLimit:'20个工作日', frequency:'高', createdAt:datetime(), updatedAt:datetime()});

CREATE (mt4:Matter {bizId:'matter_004', name:'医保报销', type:'Matter', summary:'住院或门诊医疗费用报销申请', status:1, source:'manual', aliases:['医疗报销','看病报销','医保报销流程'], matterCode:'SB-YB-001', serviceMode:'线上+线下', timeLimit:'30个工作日', frequency:'高', createdAt:datetime(), updatedAt:datetime()});

CREATE (mt5:Matter {bizId:'matter_005', name:'公积金提取', type:'Matter', summary:'住房公积金账户余额提取', status:1, source:'manual', aliases:['提取公积金','公积金怎么提取','公积金怎么领取','取公积金'], matterCode:'GJJ-TQ-001', serviceMode:'线上+线下', timeLimit:'3个工作日', frequency:'高', createdAt:datetime(), updatedAt:datetime()});

CREATE (mt6:Matter {bizId:'matter_006', name:'公积金贷款', type:'Matter', summary:'住房公积金个人住房贷款申请', status:1, source:'manual', aliases:['公积金房贷','公积金按揭','用公积金贷款'], matterCode:'GJJ-DK-001', serviceMode:'线上+线下', timeLimit:'15个工作日', frequency:'高', createdAt:datetime(), updatedAt:datetime()});

CREATE (mt7:Matter {bizId:'matter_007', name:'生育登记', type:'Matter', summary:'一孩二孩生育登记服务', status:1, source:'manual', aliases:['生育登记办理','准生证','生育服务证'], matterCode:'JS-SY-001', serviceMode:'线上+线下', timeLimit:'即时办结', frequency:'中', createdAt:datetime(), updatedAt:datetime()});

CREATE (mt8:Matter {bizId:'matter_008', name:'生育津贴申领', type:'Matter', summary:'产假期间生育保险津贴申领', status:1, source:'manual', aliases:['生育津贴','产假工资','生育报销'], matterCode:'JS-BT-001', serviceMode:'线上+线下', timeLimit:'20个工作日', frequency:'中', createdAt:datetime(), updatedAt:datetime()});

CREATE (mt9:Matter {bizId:'matter_009', name:'居住证办理', type:'Matter', summary:'非本市户籍人员居住证首次申领或续签', status:1, source:'manual', aliases:['办居住证','居住证申请','暂住证办理'], matterCode:'MZ-JZ-001', serviceMode:'线上+线下', timeLimit:'15个工作日', frequency:'高', createdAt:datetime(), updatedAt:datetime()});

CREATE (mt10:Matter {bizId:'matter_010', name:'结婚登记', type:'Matter', summary:'内地居民结婚登记', status:1, source:'manual', aliases:['领结婚证','登记结婚','办结婚'], matterCode:'MZ-HJ-001', serviceMode:'线下', timeLimit:'即时办结', frequency:'中', createdAt:datetime(), updatedAt:datetime()});

CREATE (mt11:Matter {bizId:'matter_011', name:'失业保险金申领', type:'Matter', summary:'非因本人意愿中断就业后申领失业保险金', status:1, source:'manual', aliases:['领失业金','失业金','失业保险'], matterCode:'SB-SY-001', serviceMode:'线上+线下', timeLimit:'10个工作日', frequency:'中', createdAt:datetime(), updatedAt:datetime()});

CREATE (mt12:Matter {bizId:'matter_012', name:'工伤认定', type:'Matter', summary:'职工工伤事故伤害认定申请', status:1, source:'manual', aliases:['工伤鉴定','工伤申报','工伤申请'], matterCode:'SB-GS-001', serviceMode:'线下', timeLimit:'60日', frequency:'低', createdAt:datetime(), updatedAt:datetime()});

CREATE (mt13:Matter {bizId:'matter_013', name:'灵活就业社保参保', type:'Matter', summary:'灵活就业人员参加基本养老保险和医疗保险', status:1, source:'manual', aliases:['个人参保','自由职业社保','灵活就业社保'], matterCode:'SB-LH-001', serviceMode:'线上+线下', timeLimit:'即时办结', frequency:'中', createdAt:datetime(), updatedAt:datetime()});

CREATE (mt14:Matter {bizId:'matter_014', name:'公积金账户查询', type:'Matter', summary:'查询个人住房公积金账户余额和缴存明细', status:1, source:'manual', aliases:['查公积金','公积金余额','公积金缴存明细'], matterCode:'GJJ-CX-001', serviceMode:'线上', timeLimit:'即时', frequency:'高', createdAt:datetime(), updatedAt:datetime()});

CREATE (mt15:Matter {bizId:'matter_015', name:'社保缴费查询', type:'Matter', summary:'查询个人社保缴费记录和参保状态', status:1, source:'manual', aliases:['查社保','社保缴费记录','社保明细'], matterCode:'SB-CX-001', serviceMode:'线上', timeLimit:'即时', frequency:'高', createdAt:datetime(), updatedAt:datetime()});

// ─────────────────────────────────────────────────────
// 9. 关系 (Relationships)
// ─────────────────────────────────────────────────────

// --- matter_001 社保卡申领 ---
MATCH (a:Matter {bizId:'matter_001'}), (b:Material {bizId:'material_001'}) CREATE (a)-[:REQUIRES_MATERIAL {bizId:'edge_001', relationType:'REQUIRES_MATERIAL', label:'需要', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_001'}), (b:Material {bizId:'material_002'}) CREATE (a)-[:REQUIRES_MATERIAL {bizId:'edge_002', relationType:'REQUIRES_MATERIAL', label:'需要', sortOrder:2, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_001'}), (b:Department {bizId:'dept_001'}) CREATE (a)-[:HANDLED_BY {bizId:'edge_003', relationType:'HANDLED_BY', label:'办理部门', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_001'}), (b:Channel {bizId:'channel_001'}) CREATE (a)-[:AVAILABLE_AT {bizId:'edge_004', relationType:'AVAILABLE_AT', label:'线上办理', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_001'}), (b:Channel {bizId:'channel_002'}) CREATE (a)-[:AVAILABLE_AT {bizId:'edge_005', relationType:'AVAILABLE_AT', label:'线下办理', sortOrder:2, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_001'}), (b:Policy {bizId:'policy_001'}) CREATE (a)-[:BASED_ON {bizId:'edge_006', relationType:'BASED_ON', label:'政策依据', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);

// --- matter_002 社保转移接续 ---
MATCH (a:Matter {bizId:'matter_002'}), (b:Material {bizId:'material_001'}) CREATE (a)-[:REQUIRES_MATERIAL {bizId:'edge_010', relationType:'REQUIRES_MATERIAL', label:'需要', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_002'}), (b:Material {bizId:'material_003'}) CREATE (a)-[:REQUIRES_MATERIAL {bizId:'edge_011', relationType:'REQUIRES_MATERIAL', label:'需要', sortOrder:2, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_002'}), (b:Department {bizId:'dept_001'}) CREATE (a)-[:HANDLED_BY {bizId:'edge_012', relationType:'HANDLED_BY', label:'办理部门', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_002'}), (b:Channel {bizId:'channel_001'}) CREATE (a)-[:AVAILABLE_AT {bizId:'edge_013', relationType:'AVAILABLE_AT', label:'线上办理', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);

// --- matter_003 养老金申领 ---
MATCH (a:Matter {bizId:'matter_003'}), (b:Material {bizId:'material_001'}) CREATE (a)-[:REQUIRES_MATERIAL {bizId:'edge_020', relationType:'REQUIRES_MATERIAL', label:'需要', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_003'}), (b:Material {bizId:'material_003'}) CREATE (a)-[:REQUIRES_MATERIAL {bizId:'edge_021', relationType:'REQUIRES_MATERIAL', label:'需要', sortOrder:2, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_003'}), (b:Material {bizId:'material_005'}) CREATE (a)-[:REQUIRES_MATERIAL {bizId:'edge_022', relationType:'REQUIRES_MATERIAL', label:'需要', sortOrder:3, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_003'}), (b:Condition {bizId:'condition_003'}) CREATE (a)-[:HAS_CONDITION {bizId:'edge_023', relationType:'HAS_CONDITION', label:'条件', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_003'}), (b:Department {bizId:'dept_001'}) CREATE (a)-[:HANDLED_BY {bizId:'edge_024', relationType:'HANDLED_BY', label:'办理部门', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_003'}), (b:Outcome {bizId:'outcome_001'}) CREATE (a)-[:RESULTS_IN {bizId:'edge_025', relationType:'RESULTS_IN', label:'办理结果', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);

// --- matter_004 医保报销 ---
MATCH (a:Matter {bizId:'matter_004'}), (b:Material {bizId:'material_001'}) CREATE (a)-[:REQUIRES_MATERIAL {bizId:'edge_030', relationType:'REQUIRES_MATERIAL', label:'需要', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_004'}), (b:Material {bizId:'material_003'}) CREATE (a)-[:REQUIRES_MATERIAL {bizId:'edge_031', relationType:'REQUIRES_MATERIAL', label:'需要', sortOrder:2, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_004'}), (b:Condition {bizId:'condition_001'}) CREATE (a)-[:HAS_CONDITION {bizId:'edge_032', relationType:'HAS_CONDITION', label:'条件', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_004'}), (b:Department {bizId:'dept_001'}) CREATE (a)-[:HANDLED_BY {bizId:'edge_033', relationType:'HANDLED_BY', label:'办理部门', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_004'}), (b:Channel {bizId:'channel_002'}) CREATE (a)-[:AVAILABLE_AT {bizId:'edge_034', relationType:'AVAILABLE_AT', label:'线下办理', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);

// --- matter_005 公积金提取 ---
MATCH (a:Matter {bizId:'matter_005'}), (b:Material {bizId:'material_001'}) CREATE (a)-[:REQUIRES_MATERIAL {bizId:'edge_040', relationType:'REQUIRES_MATERIAL', label:'需要', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_005'}), (b:Material {bizId:'material_009'}) CREATE (a)-[:REQUIRES_MATERIAL {bizId:'edge_041', relationType:'REQUIRES_MATERIAL', label:'需要', sortOrder:2, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_005'}), (b:Condition {bizId:'condition_002'}) CREATE (a)-[:HAS_CONDITION {bizId:'edge_042', relationType:'HAS_CONDITION', label:'条件', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_005'}), (b:Condition {bizId:'condition_005'}) CREATE (a)-[:HAS_CONDITION {bizId:'edge_043', relationType:'HAS_CONDITION', label:'条件', sortOrder:2, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_005'}), (b:Condition {bizId:'condition_006'}) CREATE (a)-[:HAS_CONDITION {bizId:'edge_044', relationType:'HAS_CONDITION', label:'条件', sortOrder:3, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_005'}), (b:Department {bizId:'dept_002'}) CREATE (a)-[:HANDLED_BY {bizId:'edge_045', relationType:'HANDLED_BY', label:'办理部门', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_005'}), (b:Channel {bizId:'channel_001'}) CREATE (a)-[:AVAILABLE_AT {bizId:'edge_046', relationType:'AVAILABLE_AT', label:'线上办理', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_005'}), (b:Channel {bizId:'channel_003'}) CREATE (a)-[:AVAILABLE_AT {bizId:'edge_047', relationType:'AVAILABLE_AT', label:'APP办理', sortOrder:2, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_005'}), (b:Policy {bizId:'policy_002'}) CREATE (a)-[:BASED_ON {bizId:'edge_048', relationType:'BASED_ON', label:'政策依据', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_005'}), (b:Outcome {bizId:'outcome_002'}) CREATE (a)-[:RESULTS_IN {bizId:'edge_049', relationType:'RESULTS_IN', label:'办理结果', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);

// --- matter_006 公积金贷款 ---
MATCH (a:Matter {bizId:'matter_006'}), (b:Material {bizId:'material_001'}) CREATE (a)-[:REQUIRES_MATERIAL {bizId:'edge_050', relationType:'REQUIRES_MATERIAL', label:'需要', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_006'}), (b:Material {bizId:'material_009'}) CREATE (a)-[:REQUIRES_MATERIAL {bizId:'edge_051', relationType:'REQUIRES_MATERIAL', label:'需要', sortOrder:2, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_006'}), (b:Condition {bizId:'condition_002'}) CREATE (a)-[:HAS_CONDITION {bizId:'edge_052', relationType:'HAS_CONDITION', label:'条件', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_006'}), (b:Department {bizId:'dept_002'}) CREATE (a)-[:HANDLED_BY {bizId:'edge_053', relationType:'HANDLED_BY', label:'办理部门', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_006'}), (b:Channel {bizId:'channel_002'}) CREATE (a)-[:AVAILABLE_AT {bizId:'edge_054', relationType:'AVAILABLE_AT', label:'线下办理', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_006'}), (b:PersonType {bizId:'person_001'}) CREATE (a)-[:APPLIES_TO {bizId:'edge_055', relationType:'APPLIES_TO', label:'适用对象', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);

// --- matter_007 生育登记 ---
MATCH (a:Matter {bizId:'matter_007'}), (b:Material {bizId:'material_001'}) CREATE (a)-[:REQUIRES_MATERIAL {bizId:'edge_060', relationType:'REQUIRES_MATERIAL', label:'需要', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_007'}), (b:Material {bizId:'material_006'}) CREATE (a)-[:REQUIRES_MATERIAL {bizId:'edge_061', relationType:'REQUIRES_MATERIAL', label:'需要', sortOrder:2, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_007'}), (b:Material {bizId:'material_007'}) CREATE (a)-[:REQUIRES_MATERIAL {bizId:'edge_062', relationType:'REQUIRES_MATERIAL', label:'需要', sortOrder:3, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_007'}), (b:Condition {bizId:'condition_007'}) CREATE (a)-[:HAS_CONDITION {bizId:'edge_063', relationType:'HAS_CONDITION', label:'条件', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_007'}), (b:Department {bizId:'dept_003'}) CREATE (a)-[:HANDLED_BY {bizId:'edge_064', relationType:'HANDLED_BY', label:'办理部门', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_007'}), (b:Channel {bizId:'channel_001'}) CREATE (a)-[:AVAILABLE_AT {bizId:'edge_065', relationType:'AVAILABLE_AT', label:'线上办理', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);

// --- matter_008 生育津贴申领 ---
MATCH (a:Matter {bizId:'matter_008'}), (b:Material {bizId:'material_001'}) CREATE (a)-[:REQUIRES_MATERIAL {bizId:'edge_070', relationType:'REQUIRES_MATERIAL', label:'需要', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_008'}), (b:Material {bizId:'material_007'}) CREATE (a)-[:REQUIRES_MATERIAL {bizId:'edge_071', relationType:'REQUIRES_MATERIAL', label:'需要', sortOrder:2, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_008'}), (b:Condition {bizId:'condition_001'}) CREATE (a)-[:HAS_CONDITION {bizId:'edge_072', relationType:'HAS_CONDITION', label:'条件', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_008'}), (b:Department {bizId:'dept_001'}) CREATE (a)-[:HANDLED_BY {bizId:'edge_073', relationType:'HANDLED_BY', label:'办理部门', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_008'}), (b:Outcome {bizId:'outcome_003'}) CREATE (a)-[:RESULTS_IN {bizId:'edge_074', relationType:'RESULTS_IN', label:'办理结果', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);

// --- matter_009 居住证办理 ---
MATCH (a:Matter {bizId:'matter_009'}), (b:Material {bizId:'material_001'}) CREATE (a)-[:REQUIRES_MATERIAL {bizId:'edge_080', relationType:'REQUIRES_MATERIAL', label:'需要', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_009'}), (b:Material {bizId:'material_002'}) CREATE (a)-[:REQUIRES_MATERIAL {bizId:'edge_081', relationType:'REQUIRES_MATERIAL', label:'需要', sortOrder:2, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_009'}), (b:Material {bizId:'material_004'}) CREATE (a)-[:REQUIRES_MATERIAL {bizId:'edge_082', relationType:'REQUIRES_MATERIAL', label:'需要', sortOrder:3, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_009'}), (b:Channel {bizId:'channel_002'}) CREATE (a)-[:AVAILABLE_AT {bizId:'edge_083', relationType:'AVAILABLE_AT', label:'线下办理', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_009'}), (b:Channel {bizId:'channel_001'}) CREATE (a)-[:AVAILABLE_AT {bizId:'edge_084', relationType:'AVAILABLE_AT', label:'线上办理', sortOrder:2, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);

// --- matter_010 结婚登记 ---
MATCH (a:Matter {bizId:'matter_010'}), (b:Material {bizId:'material_001'}) CREATE (a)-[:REQUIRES_MATERIAL {bizId:'edge_090', relationType:'REQUIRES_MATERIAL', label:'需要', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_010'}), (b:Material {bizId:'material_002'}) CREATE (a)-[:REQUIRES_MATERIAL {bizId:'edge_091', relationType:'REQUIRES_MATERIAL', label:'需要', sortOrder:2, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_010'}), (b:Department {bizId:'dept_004'}) CREATE (a)-[:HANDLED_BY {bizId:'edge_092', relationType:'HANDLED_BY', label:'办理部门', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_010'}), (b:Channel {bizId:'channel_002'}) CREATE (a)-[:AVAILABLE_AT {bizId:'edge_093', relationType:'AVAILABLE_AT', label:'线下办理', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);

// --- matter_011 失业保险金申领 ---
MATCH (a:Matter {bizId:'matter_011'}), (b:Material {bizId:'material_001'}) CREATE (a)-[:REQUIRES_MATERIAL {bizId:'edge_100', relationType:'REQUIRES_MATERIAL', label:'需要', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_011'}), (b:Material {bizId:'material_003'}) CREATE (a)-[:REQUIRES_MATERIAL {bizId:'edge_101', relationType:'REQUIRES_MATERIAL', label:'需要', sortOrder:2, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_011'}), (b:Material {bizId:'material_010'}) CREATE (a)-[:REQUIRES_MATERIAL {bizId:'edge_102', relationType:'REQUIRES_MATERIAL', label:'需要', sortOrder:3, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_011'}), (b:Department {bizId:'dept_001'}) CREATE (a)-[:HANDLED_BY {bizId:'edge_103', relationType:'HANDLED_BY', label:'办理部门', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_011'}), (b:Channel {bizId:'channel_001'}) CREATE (a)-[:AVAILABLE_AT {bizId:'edge_104', relationType:'AVAILABLE_AT', label:'线上办理', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_011'}), (b:Policy {bizId:'policy_001'}) CREATE (a)-[:BASED_ON {bizId:'edge_105', relationType:'BASED_ON', label:'政策依据', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);

// --- matter_012 工伤认定 ---
MATCH (a:Matter {bizId:'matter_012'}), (b:Material {bizId:'material_001'}) CREATE (a)-[:REQUIRES_MATERIAL {bizId:'edge_110', relationType:'REQUIRES_MATERIAL', label:'需要', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_012'}), (b:Material {bizId:'material_004'}) CREATE (a)-[:REQUIRES_MATERIAL {bizId:'edge_111', relationType:'REQUIRES_MATERIAL', label:'需要', sortOrder:2, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_012'}), (b:Department {bizId:'dept_001'}) CREATE (a)-[:HANDLED_BY {bizId:'edge_112', relationType:'HANDLED_BY', label:'办理部门', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_012'}), (b:Channel {bizId:'channel_002'}) CREATE (a)-[:AVAILABLE_AT {bizId:'edge_113', relationType:'AVAILABLE_AT', label:'线下办理', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);

// --- matter_013 灵活就业社保参保 ---
MATCH (a:Matter {bizId:'matter_013'}), (b:Material {bizId:'material_001'}) CREATE (a)-[:REQUIRES_MATERIAL {bizId:'edge_120', relationType:'REQUIRES_MATERIAL', label:'需要', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_013'}), (b:Material {bizId:'material_003'}) CREATE (a)-[:REQUIRES_MATERIAL {bizId:'edge_121', relationType:'REQUIRES_MATERIAL', label:'需要', sortOrder:2, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_013'}), (b:Department {bizId:'dept_001'}) CREATE (a)-[:HANDLED_BY {bizId:'edge_122', relationType:'HANDLED_BY', label:'办理部门', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_013'}), (b:Channel {bizId:'channel_001'}) CREATE (a)-[:AVAILABLE_AT {bizId:'edge_123', relationType:'AVAILABLE_AT', label:'线上办理', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_013'}), (b:Channel {bizId:'channel_004'}) CREATE (a)-[:AVAILABLE_AT {bizId:'edge_124', relationType:'AVAILABLE_AT', label:'自助终端', sortOrder:2, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_013'}), (b:PersonType {bizId:'person_002'}) CREATE (a)-[:APPLIES_TO {bizId:'edge_125', relationType:'APPLIES_TO', label:'适用对象', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);

// --- matter_014 公积金账户查询 ---
MATCH (a:Matter {bizId:'matter_014'}), (b:Material {bizId:'material_009'}) CREATE (a)-[:REQUIRES_MATERIAL {bizId:'edge_130', relationType:'REQUIRES_MATERIAL', label:'需要', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_014'}), (b:Department {bizId:'dept_002'}) CREATE (a)-[:HANDLED_BY {bizId:'edge_131', relationType:'HANDLED_BY', label:'办理部门', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_014'}), (b:Channel {bizId:'channel_001'}) CREATE (a)-[:AVAILABLE_AT {bizId:'edge_132', relationType:'AVAILABLE_AT', label:'线上办理', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_014'}), (b:Channel {bizId:'channel_003'}) CREATE (a)-[:AVAILABLE_AT {bizId:'edge_133', relationType:'AVAILABLE_AT', label:'APP办理', sortOrder:2, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);

// --- matter_015 社保缴费查询 ---
MATCH (a:Matter {bizId:'matter_015'}), (b:Material {bizId:'material_003'}) CREATE (a)-[:REQUIRES_MATERIAL {bizId:'edge_140', relationType:'REQUIRES_MATERIAL', label:'需要', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_015'}), (b:Department {bizId:'dept_001'}) CREATE (a)-[:HANDLED_BY {bizId:'edge_141', relationType:'HANDLED_BY', label:'办理部门', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_015'}), (b:Channel {bizId:'channel_001'}) CREATE (a)-[:AVAILABLE_AT {bizId:'edge_142', relationType:'AVAILABLE_AT', label:'线上办理', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_015'}), (b:Channel {bizId:'channel_004'}) CREATE (a)-[:AVAILABLE_AT {bizId:'edge_143', relationType:'AVAILABLE_AT', label:'自助终端', sortOrder:2, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);

// --- 事项间关联 (RELATED_TO) ---
MATCH (a:Matter {bizId:'matter_005'}), (b:Matter {bizId:'matter_006'}) CREATE (a)-[:RELATED_TO {bizId:'edge_200', relationType:'RELATED_TO', label:'相关', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_007'}), (b:Matter {bizId:'matter_008'}) CREATE (a)-[:RELATED_TO {bizId:'edge_201', relationType:'RELATED_TO', label:'相关', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_001'}), (b:Matter {bizId:'matter_015'}) CREATE (a)-[:RELATED_TO {bizId:'edge_202', relationType:'RELATED_TO', label:'相关', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);
MATCH (a:Matter {bizId:'matter_003'}), (b:Matter {bizId:'matter_011'}) CREATE (a)-[:RELATED_TO {bizId:'edge_203', relationType:'RELATED_TO', label:'相关', sortOrder:1, status:1, source:'manual', createdAt:datetime(), updatedAt:datetime()}]->(b);

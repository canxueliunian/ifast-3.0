**#基础备注内容**
1. 数据库设计:
  - 所有字段都采用java大小写分割风格设计,且名称尽可能准确,留有注释
  - 设置double,demecal 等格式时保留小数点后两位
  - 设置type类型的时候,数字全部从1开始,如:type类型 基础包--1 ,单选包--2 ,多选包--3
2. type类型(数据表--字段名称--对应含义)
   - packageType: 1 基础包 2 单选包 3 多选包
   - rateType:  清扫频率类型  1 为每日, 2 为每周
   - entryType: 1 为第一级, 2 为第二级, 只有多选包的第二层该属性为2 

2. 表单基础:
  - item--项目 , entry--条目,通过re_item_entry 进行关联
  - baseType 字段为1 时表示母版使用 ,为2时表示为门店数据.
  - 关于花费时间与花费金额的修改:
    类型为基础包/单选包()的entry可以修改,多选包的第二级可以进行修改
    item以及多选包第一级不可进行修改,有下层会总生成
    同时在修改时间花费时同时维护上层的统计.
    
    
    --该操作在service中用一个事务中进行
  - 创建过程
    - 新建item,创建erntry,创建re_item_entry关联表,多选包创建第三级的时候维护parentId属性.
3. 房型定价表:
  - 房型定价表(tablename)中不可修改汇总时间与金额.
  - 房型定价表使用的item与entry从type为1的复制得来, 设置type为2,type为2不可进行任何修改,只能进行删除
  - 房型定价表 与item 通过 home_item 进行关联 , 其item与entry则与普通关联关系相同
  
4. 其他备注:
    目前的需求以及设计情况下, 可以把通用设置作为hotel 0 房型0 的关联数据, 也就是只使用一套item与entry, 但是为了方便以后的扩展性, 以及房间与母版的单独个性化设置, 使用单独的属性设置.
  
 # **当有新变动时请维护该文档 !!!!!!!!**

>           く__,.ヘヽ.　　　　/　,ー､ 〉
>           　　　＼ ', !-─‐-i　/　/´
>           　　　 　 ／｀ｰ'　　　 L/／｀ヽ､
>           　　 　 /　 ／,　 /|　 ,　 ,　　　 ',
>           　　　ｲ 　/ /-‐/　ｉ　L_ ﾊ ヽ!　 i
>           　　　 ﾚ ﾍ 7ｲ｀ﾄ　 ﾚ'-ﾄ､!ハ|　 |
>           　　　　 !,/7 '✪'　　 ´i✪ﾊiソ| 　 |　　　
>           　　　　 |.从"　　_　　 ,,,, / |./ 　 |
>           　　　　 ﾚ'| i＞.､,,__　_,.イ / 　.i 　|
>           　　　 ﾚ'| | / k_７_/ﾚ'ヽ,　ﾊ.　|
>           　　　 | |/i 〈|/　 i　,.ﾍ |　i　|
>           　　　.|/ /　ｉ： 　 ﾍ!　　＼　|
>           　　　 　 　 kヽ>､ﾊ 　 _,.ﾍ､ 　 /､!
>           　　　 !'〈//｀Ｔ´', ＼ ｀'7'ｰr'
>           　　　 ﾚ'ヽL__|___i,___,ンﾚ|ノ
>           　　　 　　　ﾄ-,/　|___./
>           　　　 　　　'ｰ'　　!_,.:
           


关于前端部分: 
显示映射:
 {
                        field: 'onoff',
                        title: '状态',
                        formatter : function (value, row, index) {
                            if (row['onoff'] == 0) {
                                return '正常';
                            }
                            if (row['onoff'] == 1) {
                                return '关闭';
                            }
                            return value;
                        }
                    },
  修改部分:
  单选按钮样式:
   <div class="form-group">
                              <label class="col-sm-3 control-label">清洁师类型：</label>
                              <div class="col-sm-8">
                                  <input id="type" th:value="${worker.workType}" class="form-control" type="hidden">
                                  <select class="form-control" id="workType" name="workType" style="width: 100%">
                                      <option value="1">
                                          保洁
                                      </option>
                                      <option value="2">
                                          领班&保洁
                                      </option>
                                  </select>
                              </div>
                          </div>
  
  
  
  
  下拉框样式:
  
  
  
  开关demo代码
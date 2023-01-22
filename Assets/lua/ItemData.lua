--首先从AB包中加载json文本
local txt = ABMgr:LoadRes("json","ItemData",typeof(TextAsset))
--获取它的文本信息 进行json解析（通过JsonUtility）
--print(txt.text)   --测试
local itemList = Json.decode(txt.text)
--把itemList转化为类似于键值对的形式
ItemData = {}
for _, value in pairs(itemList) do
    --唯一id确定某个道具的信息
    ItemData[value.id]=value
    
end
 
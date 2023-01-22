--一个面板对应一个表
BagPanel = {}

--"成员变量"
BagPanel.panelObj = nil
BagPanel.nowType = nil  --当前tog类型
--各个控件
BagPanel.CloseBtn = nil  --背包面板上的关闭按钮
BagPanel.TogEquip = nil  --装备选项
BagPanel.TogProp = nil  --道具选项
BagPanel.TogGem = nil  --宝石选项
BagPanel.ScrollView = nil  --ScrollView
BagPanel.Content = nil  --ScrollView中的Content内容框
--存储当前页面显示的格子
BagPanel.items = {}

--"成员方法"
--初始化方法
function BagPanel:Init()
    if self.panelObj == nil then
        --1.实例化面板对象
        self.panelObj = ABMgr:LoadRes("ui","BagPanel",typeof(GameObject))  --从AB包加载面板
        self.panelObj.transform:SetParent(Canvas,false)  --设置父节点

        --2.找控件
        self.CloseBtn = self.panelObj.transform:Find("Bag_bg/Bag_bg_closeBtn"):GetComponent("Button")
        --三个toggle
        self.TogEquip=self.panelObj.transform:Find("Bag_bg/TogGroup/Equipment_tog"):GetComponent("Toggle")
        self.TogProp=self.panelObj.transform:Find("Bag_bg/TogGroup/Prop_tog"):GetComponent("Toggle")
        self.TogGem=self.panelObj.transform:Find("Bag_bg/TogGroup/Gem_tog"):GetComponent("Toggle")
        --scrollview
        self.ScrollView=self.panelObj.transform:Find("Bag_bg/Grid_bg/Scroll View"):GetComponent("ScrollRect")
        self.Content=self.ScrollView.transform:Find("Viewport/Content")

        --3.加事件
        self.CloseBtn.onClick:AddListener(function ()
            self:HideBagPanel()
        end)
        --单选框事件
        --注：Toggle加事件监听 需要在系统委托中加 CsharpCallLua
        --解决方案  创建一个静态类-》声明一个静态list列表
        self.TogEquip.onValueChanged:AddListener(function(type)
            if type == true then
                self:ChangeType("equip")
            end 
        end)
        self.TogProp.onValueChanged:AddListener(function(type)
            if type == true then
                self:ChangeType("prop")
            end 
        end)
        self.TogGem.onValueChanged:AddListener(function(type)
            if type == true then
                self:ChangeType("gem")
            end 
        end)

    end
end

--控制面板的显示和隐藏
function BagPanel:ShowBagPanel()  --显示
    self:Init()
    self.panelObj:SetActive(true)
    --第一次打开时更新数据
    if self.nowType == nil then
        self:ChangeType("equip")
    end
end

function BagPanel:HideBagPanel()  --隐藏
    self.panelObj:SetActive(false)
end

--逻辑处理函数 用来切换toggle
--type equip装备 prop道具 gem宝石
function BagPanel:ChangeType(type)
    --1.前项判断 避免重复操作
    if self.nowType == type then
        return
    end

    --2.更新之前 清空当前页面显示的格子（items）
    for i = 1,self:tableLength(self.items) do
        self.items[i]:Destroy()  --销毁格子对象
    end
    self.items = {}

    --3.根据当前toggle的类型来创建新的格子以及初始化物品信息
    local NowType = nil
    if type == "equip" then
        NowType = PlayerData.equips  --得到装备栏的所有物品信息（id和num）
    elseif type == "prop" then
        NowType = PlayerData.props  --得到道具栏的所有物品信息
    else
        NowType = PlayerData.gems  --得到宝石栏的所有物品信息
    end

    --创建格子
    for i = 1, self:tableLength(NowType) do
        --1.根据数据创建格子对象
        local grid = ItemGrid:new()
        --2.设置对象位置
        grid:Init(self.Content,i)
        --3.初始化它的信息 图标 数量
        grid:InitData(NowType,i)
        --4.生成的格子存起来
        table.insert(self.items,grid)  --生成的格子存入items
    end
end

--计算表的长度   #计算原理是用ipairs遍历的   遇到不连续的key值会退出导致计算不准
function BagPanel:tableLength(table)
    local count = 0
    for _, _ in pairs(table) do
        count = count + 1
    end
    return count
end



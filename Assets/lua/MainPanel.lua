--一个面板对应一个表
MainPanel = {}

--成员变量
MainPanel.panelObj=nil  --关联的面板对象
MainPanel.BugBtn=nil  --对应的面板控件
MainPanel.SkillBtn=nil

--“成员方法”
--初始化该面板 添加事件点击监听
function MainPanel:Init()
    --面板对象没有实例化过才去实例化处理
    if self.panelObj == nil then
        --1.实例化面板对象  ABMgr + 设置父对象
    --传入类型 避免同名产生影响
    self.panelObj=ABMgr:LoadRes("ui","MainPanel",typeof(GameObject))
    self.panelObj.transform:SetParent(Canvas,false)  --初始化主界面
    --2.找到对应控件
    self.BugBtn=self.panelObj.transform:Find("BagBtn"):GetComponent("Button")  --找到背包按钮
    print(self.BugBtn)
    --3.为控件加上事件监听 进行点击等等的逻辑处理
    self.BugBtn.onClick:AddListener(function()  --为背包按钮添加按钮点击事件
        self:BugBtnClick()
    end)
    end
end

function MainPanel:ShowMainPanel()
    self:Init()
    self.panelObj:SetActive(true)
end

function MainPanel:HideMainPanel()
    self.panelObj:SetActive(false)
end

function MainPanel:BugBtnClick()
    BagPanel:ShowBagPanel()
end
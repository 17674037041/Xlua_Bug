
--生成一个table "ItemGrid"
Object:subClass("ItemGrid")

--成员变量
ItemGrid.obj = nil  --格子
ItemGrid.imgIcon = nil  --物品图标
ItemGrid.text = nil  --物品数量

--成员函数
function ItemGrid:Init(father,i)
    --加载一个格子
    self.obj = ObjectPool:Get_GridObj()  --从池中获取一个对象
    self.obj:SetActive(true)
    -- local w = 0
    -- local h = 0
    -- w = self.obj:GetComponent("RectTransform").rect.width  --格子宽度
    -- h = self.obj:GetComponent("RectTransform").rect.height  --格子高度
    --设置父对象
    self.obj.transform:SetParent(father,false)
    -- --初始化格子和物品信息
    -- local x = (i-1) % 2 * (w+60)  --格子的x坐标
    -- local y = math.floor((i-1) / 2) * (h+20)  --格子的y坐标
    -- self.obj.transform.localPosition = Vector3(x,-y,0)  --初始化格子位置
    self.imgIcon = self.obj.transform:Find("Item_icon"):GetComponent("Image")  --物品图标
    self.text = self.obj.transform:Find("Item_num"):GetComponent("Text")  --物品数量
end

function ItemGrid:InitData(NowType,i)
    local data = ItemData[NowType[i].id]  --唯一id得到唯一物品信息
    local strs = string.split(data.icon,"_")  --分割图集名和图标名
    local spriteAtlas = ABMgr:LoadRes("ui",strs[1])  --加载图集
    self.imgIcon.sprite = spriteAtlas:GetSprite(strs[2])  --设置图标
    self.text.text = NowType[i].num  --设置物品数量
end

function ItemGrid:Destroy()
    GameObject.Destroy(self.obj)
    self.obj = nil
end
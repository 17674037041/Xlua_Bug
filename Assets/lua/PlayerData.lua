PlayerData = {}

--不同类型的数据分开存储
PlayerData.equips={}
PlayerData.props={}
PlayerData.gems={}

--初始化数据
function PlayerData:Init()
    for key, _ in pairs(ItemData) do
        if ItemData[key].type == "equipment" then
            table.insert( self.equips, {id = key,num = math.random(1,10)} )
            elseif ItemData[key].type == "prop" then
                table.insert( self.props, {id = key,num = 1} )
            else
                table.insert( self.gems, {id = key,num = 1} )
        end 
    end
end


    
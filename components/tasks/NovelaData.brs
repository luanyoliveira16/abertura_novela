sub Init()
    m.top.functionName = "GetContent"
end sub

sub GetContent()
    feed = ReadAsciiFile("pkg:/components/feed/novelas.json")
    json = ParseJson(feed)
    rootChildren = []
    
  
    if json <> invalid           
          row = {}
          row.children =[]
          for each item in json
            itemData = GetItemData(item)
            row.children.Push(itemData)
          end for
            rootChildren.Push(row)
        

    
        contentNode = CreateObject("roSGNode", "ContentNode")
        contentNode.Update({
            children: rootChildren
        }, true)
        m.top.content = contentNode
    end if
   
   
end sub


function GetItemData(infos as Object) as Object
    item = {}
    item.name = infos.name
    item.description = infos.overview
    item.hdPosterURL = infos.thumbnail
    item.year = infos.year
    item.url = infos.video
    
    return item
end function


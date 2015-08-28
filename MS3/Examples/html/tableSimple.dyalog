﻿:class tableSimple: MiPageSample
⍝ Control:: _html.table _html.tr _html.th _html.td _html.caption _html.tbody _html.thead _html.tfoot _html.colgroup _html.col   
⍝ Description:: Insert a table using all types of formatting options

    ∇ Compose  ;mydata;mytable;mycolgroup;mycols;myhead;mhr;mybody;myfoot
      :Access public
     
      mydata←?3 5⍴4+⍳5
     
      mytable←Add _.table
     
    ⍝ Column-wise formatting
      mycolgroup←mytable.Add _.colgroup
      mycols← mycolgroup.Add¨ 7/_.col ⍝ we don't actually need a col for each column
      mycols.Set ⊂'width="50"'
      mycols[4].  Set 'style=background-color:pink'
      mycols[1 7].Set ⊂'style=background-color:orchid'
      ⍝ Columns that did not receive formating remain with the default
     
    ⍝ Header
      myhead←mytable.Add _.thead
      mhr←myhead.Add _.tr
      mhr.Add¨ _.th,¨ ' ',¯3+⎕TS[1]+⍳5
     
     ⍝ Body
      mybody←mytable.Add _.tbody
      (mybody.Add _.tr).Add¨ _.td,¨ (⊂'BB'),mydata[1;]
      (mybody.Add _.tr).Add¨ _.td,¨ (⊂'DB'),mydata[2;]
      (mybody.Add _.tr).Add¨ _.td,¨ (⊂'AB'),mydata[3;]
     
     ⍝ Footer
      myfoot←mytable.Add _.tfoot
      (myfoot.Add _.tr).Add¨ _.td,¨ (⊂'Total'),(+⌿mydata),(+/,mydata) ⍝ uneven rows allowed
     
     ⍝ Caption always goes on top, even if added later
      mytable.Add _.caption 'Sales'
    ∇

:endclass
(function(ADL){
   ADL.verbs = {
      "asked" : {
         "id" : "http://adlnet.gov/expapi/verbs/asked",
         "display" : {"en-US" : "asked","zh-TW":"開始IRS"}
      },
      "attempted" : {
         "id" : "http://adlnet.gov/expapi/verbs/attempted",
         "display" : {"en-US" : "attempted"}
      },
      "attended" : {
         "id" : "https://w3id.org/xapi/acrossx/verbs/attended",
         "display" : {"en-US" : "attended"}
      },
      "commented" : {
         "id" : "https://w3id.org/xapi/acrossx/verbs/commented",
         "display" : {"en-US" : "commented"}
      },
      "experienced" : {
         "id" : "https://w3id.org/xapi/acrossx/verbs/experienced",
         "display" : {"en-US" : "experienced"}
      },
      "failed" : {
         "id" : "https://w3id.org/xapi/acrossx/verbs/failed",
         "display" : {"en-US" : "failed"}
      },
      "imported" : {
         "id" : "https://w3id.org/xapi/acrossx/verbs/imported",
         "display" : {"en-US" : "imported"}
      },
      "initialized" : {
         "id" : "https://w3id.org/xapi/acrossx/verbs/initialized",
         "display" : {"en-US" : "initialized"}
      },
      "interacted" : {
         "id" : "http://adlnet.gov/expapi/verbs/interacted",
         "display" : {"en-US" : "interacted"}
      },
      "launched" : {
         "id" : "https://w3id.org/xapi/acrossx/verbs/launched",
         "display" : {"en-US" : "launched"}
      },
      "mastered" : {
         "id" : "https://w3id.org/xapi/acrossx/verbs/mastered",
         "display" : {"en-US" : "mastered"}
      },
      "passed" : {
         "id" : "https://w3id.org/xapi/acrossx/verbs/passed",
         "display" : {"en-US" : "passed"}
      },
      "preferred" : {
         "id" : "https://w3id.org/xapi/acrossx/verbs/preferred",
         "display" : {"en-US" : "preferred"}
      },
      "progressed" : {
         "id" : "https://w3id.org/xapi/acrossx/verbs/progressed",
         "display" : {"en-US" : "progressed"}
      },
      "registered" : {
         "id" : "https://w3id.org/xapi/acrossx/verbs/registered",
         "display" : {"en-US" : "registered"}
      },
      "responded" : {
         "id" : "https://w3id.org/xapi/acrossx/verbs/responded",
         "display" : {"en-US" : "responded"}
      },
      "resumed" : {
         "id" : "https://w3id.org/xapi/acrossx/verbs/resumed",
         "display" : {"en-US" : "resumed"}
      },
      "shared" : {
         "id" : "http://adlnet.gov/expapi/verbs/shared",
         "display" : {"en-US" : "shared","zh-TW":"進行分享"}
      },
      "suspended" : {
         "id" : "https://w3id.org/xapi/acrossx/verbs/suspended",
         "display" : {"en-US" : "suspended"}
      },
      "terminated" : {
         "id" : "https://w3id.org/xapi/acrossx/verbs/terminated",
         "display" : {"en-US" : "terminated"}
      },
      "voided" : {
         "id" : "https://w3id.org/xapi/acrossx/verbs/voided",
         "display" : {"en-US" : "voided"}
      },
      //上面為25個初版的動詞,下方16個為新增所用到的動詞,因此在LRS中的top 10無法顯示
      "Log In" : {
         //"id" : "https://brindlewaye.com/xAPITerms/verbs/loggedin/",
         "id" : "https://w3id.org/xapi/adl/verbs/loggedin",
         "display" :{"en-US":"Log In","zh-TW":"登入"}
      },
      "logged-in" : {
         //"id" : "https://brindlewaye.com/xAPITerms/verbs/loggedin/",
         "id" : "https://w3id.org/xapi/adl/verbs/logged-in",
         "display" :{"en-US":"logged-in","zh-TW":"登入"}
      },
      "Log Out" : {
         //"id" : "https://brindlewaye.com/xAPITerms/verbs/loggedin/",
         "id" : "https://w3id.org/xapi/adl/verbs/loggedout",
         "display" :{"en-US":"Log Out","zh-TW":"登出"}
      },
      "exited" : {
         "id" : "https://w3id.org/xapi/acrossx/verbs/exited",
         "display" :{"en-US":"exited","zh-TW":"登出"}
      },
      "focused" : {
         "id" : "https://w3id.org/xapi/acrossx/verbs/focused",
         "display" :{"en-US":"focused","zh-TW":"同步"}
      },
      "unfocused" : {
         "id" : "https://w3id.org/xapi/acrossx/verbs/unfocused",
         "display" :{"en-US":"unfocused","zh-TW":"解除同步"}
      },
      "opened" : {
         "id" : "https://w3id.org/xapi/acrossx/verbs/opened",
         "display" :{"en-US":"opened","zh-TW":"開啟"}
      },
      "closed" : {
         "id" : "https://w3id.org/xapi/acrossx/verbs/closed",
         "display" :{"en-US":"closed","zh-TW":"關閉"}
      },
      "retracted" : {
         "id" : "https://w3id.org/xapi/acrossx/verbs/retracted",
         "display" :{"en-US":"retracted","zh-TW":"結束IRS"}
      },
      "assigned" : {
         "id" : "https://w3id.org/xapi/acrossx/verbs/assigned",
         "display" :{"en-US":"assigned","zh-TW":"派送"}
      },
      "answered" : {
         "id" : "http://adlnet.gov/expapi/verbs/answered",
         "display" :{"en-US":"answered","zh-TW":"回答"}
      },
      "watched" : {
         //"id" : "http://activitystrea.ms/schema/1.0/watch",
         "id" : "https://w3id.org/xapi/acrossx/verbs/watch",
         "display" :{"en-US":"watched","zh-TW":"看"}
      },
      "viewed" : {
         "id" : "https://w3id.org/xapi/acrossx/verbs/viewed",
         "display" :{"en-US":"viewed","zh-TW":"看"}
      },
      "started" : {
         //"id" : "http://activitystrea.ms/schema/1.0/start",
         "id" : "https://w3id.org/xapi/acrossx/verbs/start",
         "display" :{"en-US":"started","zh-TW":"開始"}
      },
      "completed" : {
         "id" : "http://adlnet.gov/expapi/verbs/completed",
         "display" :{"en-US":"completed","zh-TW":"完成"}
      },
      "scored" : {
         "id" : "https://w3id.org/xapi/acrossx/verbs/scored",
         "display" :{"en-US":"scored","zh-TW":"得分"}
      },
      "created" : {
         "id" : "https://w3id.org/xapi/acrossx/verbs/create",
         "display" :{"en-US":"created","zh-TW":"創建"}
      },
      "saved" : {
         "id" : "https://w3id.org/xapi/acrossx/verbs/save",
         "display" :{"en-US":"saved","zh-TW":"儲存"}
      },
      "unshared" : {
         "id" : "https://w3id.org/xapi/acrossx/verbs/unshare",
         "display" :{"en-US":"unshared","zh-TW":"取消分享"}
      },
      "liked" : {
         "id" : "https://w3id.org/xapi/acrossx/verbs/like",
         "display" :{"en-US":"like","zh-TW":"收藏"}
      },
      "read" : {
         "id" : "https://w3id.org/xapi/acrossx/verbs/read",
         "display" :{"en-US":"read","zh-TW":"讀"}
      },
      "sent" : {
         "id" : "https://w3id.org/xapi/acrossx/verbs/send",
         "display" :{"en-US":"send","zh-TW":"發送"}
      },
      "gave" : {
         "id" : "https://w3id.org/xapi/acrossx/verbs/give",
         "display" :{"en-US":"gave","zh-TW":"給"}
      },
      "borrowed" : {
         "id" : "https://w3id.org/xapi/acrossx/verbs/borrow",
         "display" :{"en-US":"borrowed","zh-TW":"收藏"}
      },
      "returned" : {
         "id" : "https://w3id.org/xapi/acrossx/verbs/returned",
         "display" :{"en-US":"returned","zh-TW":"返回"}
      },
      "purchased" : {
         "id" : "http://activitystrea.ms/schema/1.0/purchase",
         "display" :{"en-US":"purchased","zh-TW":"購買"}
      }
   };
}(window.ADL = window.ADL || {}));

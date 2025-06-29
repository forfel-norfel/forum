/-  sur=forum
/+  sig=sigil-sigil
::
|_  [=state:sur =bowl:gall]
++  login
  ^-  manx
  ?-  (clan:title src.bowl)
    %czar  sigil
    %king  sigil
    %duke  sigil
    %earl  sigil
    %pawn  login-prompt
  ==
++  get-id
  ^-  @p
  ?.  =(%pawn (clan:title src.bowl))  src.bowl
  (~(got by sessions.state) src.bowl)
++  login-prompt
  ^-  manx
  ;a/"/forum/log":"Log In"
++  new-post-link
  ^-  marl
  ?.  (~(has in admins.state) src.bowl)  ~
  ;+  ;a/"/forum/add":"new post"
++  sigil
  :: ;+  (sig(size 48) src.bowl)
  :: =/  =ship
  ::   ?+  (clan:title (~(gut by sessions.state) src.bowl (dec (bex 128))))
  ::       !!
  ::     %czar  ?:((gte (bex 64) src.bowl) src.bowl (~(got by sessions.state) src.bowl))
  ::     %king  ?:((gte (bex 64) src.bowl) src.bowl (~(got by sessions.state) src.bowl))
  ::     %duke  ?:((gte (bex 64) src.bowl) src.bowl (~(got by sessions.state) src.bowl))
  ::     %earl  ?:((gte (bex 64) src.bowl) src.bowl (~(got by sessions.state) src.bowl))
  ::   ==
  =/  ship  src.bowl
  =/  p  (scow %p ship)
    ;div.f.g2
      ;*  new-post-link
      ;a/"/forum/usr/{p}":"{p}"
    ==
++  $
  ;nav#topnav.fs.g2
    ;div.f.g2
      ;div#nav-main.fs
        ;a/"https://urbit.chat/"(class "lg:relative flex h-full items-center bg-black w-1/2 lg:w-[14.5rem] xl:w-64 type-ui"):"~    Urbit Forum"
      ==
      ;div#nav-links
      ==
    ==
    ;div#login-div
      ;+  login-prompt
    ==
    ;script:"{script}"
  ==
++  script
  ^~
  %-  trip
'''
  async function setSigil(){
    console.log("setting sigil")
    const div = document.getElementById("login-div");
    const res = await fetch("/forum/f/sigil");
    const t = await res.text();
    console.log("sigil", t);
    if (t) div.innerHTML = t;
  }  
  setSigil();
'''
--

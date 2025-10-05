import {patternVariable as O,bracketAccess as Q,createElement as G,useDidUpdate as I,newVariant as P,useEffect as H,useSignal as F,fragment as J,program as R,pattern as N,compare as E,variant as A,signal as C,record as B,match as M,style as K,batch as D,or as L} from "./runtime.js";export const S=A(1,`Maybe.Just`),T=A(0,`Maybe.Nothing`),U=A(1,`Result.Err`),V=A(1,`Result.Ok`),a=B(`CodeExample`),b=B(`SidebarItem`),c=B(`SidebarCategory`),d=B(`CaptionTrack`),e=B(`VideoQuality`),f=B(`PlatformInfo`),g=B(`PlaylistItem`),h=B(`AddressEditInfo`),i=B(`AddressEditSearchItem`),j=B(`TabItem`),k=B(`TabChangeEvent`),l=B(`TabClickEvent`),m=B(`TabScrollEvent`),n=B(`MatrixCell`),o=B(`MatrixData`),p=B(`AnimationItem`),q=B(`ApiProperty`),r=B(`CodeSnippet`),s=B(`UsageExample`),W=A(1,`Http.ResponseBody.FormData`),X=A(1,`Http.ResponseBody.JSON`),Y=A(1,`Http.ResponseBody.HTML`),Z=A(1,`Http.ResponseBody.Text`),AA=A(1,`Http.ResponseBody.XML`),AB=A(1,`Http.ResponseBody.File`),AC=A(0,`Http.Error.NetworkError`),AD=A(0,`Http.Error.Aborted`),AE=A(0,`Http.Error.Timeout`),AF=A(0,`Http.Error.BadUrl`),AG=A(0,`Month.January`),AH=A(0,`Month.February`),AI=A(0,`Month.March`),AJ=A(0,`Month.April`),AK=A(0,`Month.May`),AL=A(0,`Month.June`),AM=A(0,`Month.July`),AN=A(0,`Month.August`),AO=A(0,`Month.September`),AP=A(0,`Month.October`),AQ=A(0,`Month.November`),AR=A(0,`Month.December`),AS=A(0,`Weekday.Monday`),AT=A(0,`Weekday.Tuesday`),AU=A(0,`Weekday.Wednesday`),AV=A(0,`Weekday.Thursday`),AW=A(0,`Weekday.Friday`),AX=A(0,`Weekday.Saturday`),AY=A(0,`Weekday.Sunday`),t=C(`default`),u=(v)=>{return (Promise.resolve(v))},w=(x)=>{((() => {
      const root = document.documentElement;

      switch(x) {
        case 'default':
          root.style.setProperty('--primary-color', '#1989fa');
          root.style.setProperty('--bg-color', '#eff2f5');
          root.style.setProperty('--text-color', '#333');
          root.style.setProperty('--card-bg', '#ffffff');
          root.style.setProperty('--navbar-bg', '#ffffff');
          root.style.setProperty('--navbar-text', '#1a1a1a');
          root.style.setProperty('--sidebar-bg', '#ffffff');
          root.style.setProperty('--sidebar-text', '#34495e');
          root.style.setProperty('--heading-color', '#1a1a1a');
          root.style.setProperty('--border-color', '#f7f8fa');
          root.style.setProperty('--shadow-color', 'rgba(0, 0, 0, 0.05)');
          break;
        case 'dark':
          root.style.setProperty('--primary-color', '#1989fa');
          root.style.setProperty('--bg-color', '#0f0f0f');
          root.style.setProperty('--text-color', '#e0e0e0');
          root.style.setProperty('--card-bg', '#1a1a1a');
          root.style.setProperty('--navbar-bg', '#1a1a1a');
          root.style.setProperty('--navbar-text', '#ffffff');
          root.style.setProperty('--sidebar-bg', '#1a1a1a');
          root.style.setProperty('--sidebar-text', '#b0b0b0');
          root.style.setProperty('--heading-color', '#ffffff');
          root.style.setProperty('--border-color', '#2a2a2a');
          root.style.setProperty('--shadow-color', 'rgba(0, 0, 0, 0.3)');
          break;
        case 'light':
          root.style.setProperty('--primary-color', '#1989fa');
          root.style.setProperty('--bg-color', '#fafafa');
          root.style.setProperty('--text-color', '#333333');
          root.style.setProperty('--card-bg', '#ffffff');
          root.style.setProperty('--navbar-bg', '#ffffff');
          root.style.setProperty('--navbar-text', '#1a1a1a');
          root.style.setProperty('--sidebar-bg', '#ffffff');
          root.style.setProperty('--sidebar-text', '#555555');
          root.style.setProperty('--heading-color', '#000000');
          root.style.setProperty('--border-color', '#e8e8e8');
          root.style.setProperty('--shadow-color', 'rgba(0, 0, 0, 0.08)');
          break;
        case 'blue':
          root.style.setProperty('--primary-color', '#2a5298');
          root.style.setProperty('--bg-color', '#e8eef5');
          root.style.setProperty('--text-color', '#1e3c72');
          root.style.setProperty('--card-bg', '#f5f8fc');
          root.style.setProperty('--navbar-bg', '#1e3c72');
          root.style.setProperty('--navbar-text', '#ffffff');
          root.style.setProperty('--sidebar-bg', '#f5f8fc');
          root.style.setProperty('--sidebar-text', '#2a5298');
          root.style.setProperty('--heading-color', '#1e3c72');
          root.style.setProperty('--border-color', '#d0dce8');
          root.style.setProperty('--shadow-color', 'rgba(30, 60, 114, 0.1)');
          break;
        case 'green':
          root.style.setProperty('--primary-color', '#71b280');
          root.style.setProperty('--bg-color', '#e8f4ec');
          root.style.setProperty('--text-color', '#134e5e');
          root.style.setProperty('--card-bg', '#f0f8f3');
          root.style.setProperty('--navbar-bg', '#134e5e');
          root.style.setProperty('--navbar-text', '#ffffff');
          root.style.setProperty('--sidebar-bg', '#f0f8f3');
          root.style.setProperty('--sidebar-text', '#2d6a4f');
          root.style.setProperty('--heading-color', '#134e5e');
          root.style.setProperty('--border-color', '#c7e6d1');
          root.style.setProperty('--shadow-color', 'rgba(19, 78, 94, 0.1)');
          break;
      }
    })());return u(null)},y=(z)=>{(()=>{t.value=z})();return w(z)},aa=C(`#1989fa`),ab=(ac)=>{((() => {
      document.documentElement.style.setProperty('--primary-color', ac);
    })());return u(null)},ad=(ae)=>{(()=>{aa.value=ae})();return ab(ae)},af=()=>{w(t.value);return ab(aa.value)},ag=()=>{D(()=>{t.value=`default`;aa.value=`#1989fa`});return af()},ah=C(`desktop`),ai=(aj)=>{return (()=>{ah.value=aj})()},ak=()=>{return (E(ah.value,`desktop`)?(()=>{ah.value=`mobile`})():(()=>{ah.value=`desktop`})())},al=()=>{return E(ah.value,`mobile`)},am=()=>{return E(ah.value,`desktop`)},an=C(`home`),ao=(ap)=>{return (()=>{an.value=ap})()},aq=C(`Essentials`),ar=(as)=>{return (()=>{aq.value=as})()},at=(au,av)=>{return D(()=>{an.value=au;aq.value=av})},aw=C(false),ax=()=>{return (()=>{aw.value=!aw.value})()},ay=()=>{return (()=>{aw.value=false})()},AZ=()=>{const az=F(false),ba=()=>{return (()=>{az.value=!az.value})()},bb=()=>{return ak()},bc=()=>{return ax()};return G(`div`,{className:`hm`},[G(`div`,{className:`hn`},[G(`div`,{className:`ho`},[G(`button`,{"onClick":bc,className:`ic`},[G(`span`,{className:(aw.value?`hamburgerLine1Open`:``) + ` id`}),G(`span`,{className:(aw.value?`hamburgerLine2Open`:``) + ` id`}),G(`span`,{className:(aw.value?`hamburgerLine3Open`:``) + ` id`})]),G(`a`,{"href":`/`,className:`hp`},[G(`img`,{"src":`https://fastly.jsdelivr.net/npm/@vant/assets/logo.png`,className:`hq`}),G(`span`,{className:`hr`},[`Mint Wū`]),G(`span`,{className:`hs`},[`(Mint Lang 0.28.0)`])]),G(`ul`,{className:`ht`},[G(`li`,{className:`hu`},[G(`div`,{"onClick":bb,className:(E(ah.value,`mobile`)?`viewModeActive`:``) + ` hz`},[(E(ah.value,`mobile`)?G(`svg`,{"viewBox":`0 0 24 24`,"fill":`currentColor`,className:`viewModeIcon` + ` ia`},[G(`path`,{"d":`M17 1.01L7 1c-1.1 0-2 .9-2 2v18c0 1.1.9 2 2 2h10c1.1 0 2-.9 2-2V3c0-1.1-.9-1.99-2-1.99zM17 19H7V5h10v14z`})]):G(`svg`,{"viewBox":`0 0 24 24`,"fill":`currentColor`,className:`viewModeIcon` + ` ia`},[G(`path`,{"d":`M21 2H3c-1.1 0-2 .9-2 2v12c0 1.1.9 2 2 2h7v2H8v2h8v-2h-2v-2h7c1.1 0 2-.9 2-2V4c0-1.1-.9-2-2-2zm0 14H3V4h18v12z`})])),G(`span`,{className:`viewModeText` + ` ib`},[(E(ah.value,`mobile`)?`📱 Mobile`:`🖥️ Desktop`)])])]),G(`li`,{className:`hu`},[G(`a`,{"target":`_blank`,"href":`https://github.com/mint-lang/mint`,className:`hv`},[G(`img`,{"src":`https://fastly.jsdelivr.net/npm/@vant/assets/github.svg`,className:`hw`})])]),G(`li`,{className:`hu`},[G(`a`,{"onClick":ba,className:`hv`},[G(`img`,{"src":`https://b.yzcdn.cn/vant/dark-theme.svg`,className:`hw`})])]),G(`li`,{className:`hu`},[G(`span`,{className:`hx hy`},[`v0.28.0`])]),G(`li`,{className:`hu`},[G(`a`,{"href":`https://mint-lang.com`,"target":`_blank`,className:`hx`},[`Docs`])])])])])])},bd=()=>{return ([])},be=()=>{return [c({id:`essentials`,title:`Essentials`,icon:`📚`,items:[b({id:`introduction`,label:`Introduction`,route:`/introduction`,subtitle:``,badge:``}),b({id:`quickstart`,label:`Quickstart`,route:`/quickstart`,subtitle:``,badge:``}),b({id:`themes`,label:`Themes`,route:`/themes`,subtitle:``,badge:`NEW`}),b({id:`advanced`,label:`Advanced Usage`,route:`/advanced`,subtitle:``,badge:``}),b({id:`faq`,label:`FAQ`,route:`/faq`,subtitle:``,badge:``}),b({id:`changelog`,label:`Changelog`,route:`/changelog`,subtitle:``,badge:``}),b({id:`contribution`,label:`Contribution Guide`,route:`/contribution`,subtitle:``,badge:``})]}),c({id:`basic`,title:`Basic Components`,icon:`🧩`,items:[b({id:`avatar`,label:`Avatar`,route:`/avatar`,subtitle:``,badge:``}),b({id:`button`,label:`Button`,route:`/button`,subtitle:``,badge:``}),b({id:`cell`,label:`Cell`,route:`/cell`,subtitle:``,badge:``}),b({id:`icon`,label:`Icon`,route:`/icon`,subtitle:``,badge:``}),b({id:`image`,label:`Image`,route:`/image`,subtitle:``,badge:``}),b({id:`layout`,label:`Layout`,route:`/layout`,subtitle:``,badge:``}),b({id:`popup`,label:`Popup`,route:`/popup`,subtitle:``,badge:``}),b({id:`space`,label:`Space`,route:`/space`,subtitle:``,badge:``}),b({id:`toast`,label:`Toast`,route:`/toast`,subtitle:``,badge:``})]}),c({id:`form`,title:`Form Components`,icon:`📝`,items:[b({id:`calendar`,label:`Calendar`,route:`/calendar`,subtitle:``,badge:``}),b({id:`cascader`,label:`Cascader`,route:`/cascader`,subtitle:``,badge:``}),b({id:`checkbox`,label:`Checkbox`,route:`/checkbox`,subtitle:``,badge:``}),b({id:`datepicker`,label:`DatePicker`,route:`/datepicker`,subtitle:``,badge:``}),b({id:`field`,label:`Field`,route:`/field`,subtitle:`Input`,badge:``}),b({id:`form`,label:`Form`,route:`/form`,subtitle:``,badge:``}),b({id:`number-keyboard`,label:`NumberKeyboard`,route:`/number-keyboard`,subtitle:``,badge:``}),b({id:`password-input`,label:`PasswordInput`,route:`/password-input`,subtitle:``,badge:``}),b({id:`picker`,label:`Picker`,route:`/picker`,subtitle:``,badge:``}),b({id:`radio`,label:`Radio`,route:`/radio`,subtitle:``,badge:``}),b({id:`rate`,label:`Rate`,route:`/rate`,subtitle:``,badge:``}),b({id:`search`,label:`Search`,route:`/search`,subtitle:``,badge:``}),b({id:`slider`,label:`Slider`,route:`/slider`,subtitle:``,badge:``}),b({id:`stepper`,label:`Stepper`,route:`/stepper`,subtitle:``,badge:``}),b({id:`switch`,label:`Switch`,route:`/switch`,subtitle:``,badge:``}),b({id:`timepicker`,label:`TimePicker`,route:`/timepicker`,subtitle:``,badge:``}),b({id:`uploader`,label:`Uploader`,route:`/uploader`,subtitle:``,badge:``})]}),c({id:`action`,title:`Action Components`,icon:`⚡`,items:[b({id:`action-sheet`,label:`ActionSheet`,route:`/action-sheet`,subtitle:``,badge:``}),b({id:`dialog`,label:`Dialog`,route:`/dialog`,subtitle:``,badge:``}),b({id:`dropdown-menu`,label:`DropdownMenu`,route:`/dropdown-menu`,subtitle:``,badge:``}),b({id:`loading`,label:`Loading`,route:`/loading`,subtitle:``,badge:``}),b({id:`notify`,label:`Notify`,route:`/notify`,subtitle:``,badge:``}),b({id:`overlay`,label:`Overlay`,route:`/overlay`,subtitle:``,badge:``}),b({id:`pull-refresh`,label:`PullRefresh`,route:`/pull-refresh`,subtitle:``,badge:``}),b({id:`share-sheet`,label:`ShareSheet`,route:`/share-sheet`,subtitle:``,badge:``}),b({id:`swipe-cell`,label:`SwipeCell`,route:`/swipe-cell`,subtitle:``,badge:``})]}),c({id:`display`,title:`Display Components`,icon:`🎨`,items:[b({id:`badge`,label:`Badge`,route:`/badge`,subtitle:``,badge:``}),b({id:`circle`,label:`Circle`,route:`/circle`,subtitle:`Progress`,badge:``}),b({id:`collapse`,label:`Collapse`,route:`/collapse`,subtitle:``,badge:``}),b({id:`countdown`,label:`CountDown`,route:`/countdown`,subtitle:``,badge:``}),b({id:`divider`,label:`Divider`,route:`/divider`,subtitle:``,badge:``}),b({id:`empty`,label:`Empty`,route:`/empty`,subtitle:``,badge:``}),b({id:`image-preview`,label:`ImagePreview`,route:`/image-preview`,subtitle:``,badge:``}),b({id:`lazyload`,label:`Lazyload`,route:`/lazyload`,subtitle:``,badge:``}),b({id:`list`,label:`List`,route:`/list`,subtitle:``,badge:``}),b({id:`notice-bar`,label:`NoticeBar`,route:`/notice-bar`,subtitle:``,badge:``}),b({id:`popover`,label:`Popover`,route:`/popover`,subtitle:``,badge:``}),b({id:`progress`,label:`Progress`,route:`/progress`,subtitle:``,badge:``}),b({id:`skeleton`,label:`Skeleton`,route:`/skeleton`,subtitle:``,badge:``}),b({id:`steps`,label:`Steps`,route:`/steps`,subtitle:``,badge:``}),b({id:`sticky`,label:`Sticky`,route:`/sticky`,subtitle:``,badge:``}),b({id:`swipe`,label:`Swipe`,route:`/swipe`,subtitle:``,badge:``}),b({id:`tag`,label:`Tag`,route:`/tag`,subtitle:``,badge:``}),b({id:`text-ellipsis`,label:`TextEllipsis`,route:`/text-ellipsis`,subtitle:``,badge:``}),b({id:`video-player`,label:`VideoPlayer`,route:`/video-player`,subtitle:``,badge:``}),b({id:`watermark`,label:`Watermark`,route:`/watermark`,subtitle:``,badge:`NEW`}),b({id:`matrix`,label:`Matrix`,route:`/matrix`,subtitle:`Grid Layout`,badge:`NEW`})]}),c({id:`navigation`,title:`Navigation Components`,icon:`🧭`,items:[b({id:`action-bar`,label:`ActionBar`,route:`/action-bar`,subtitle:``,badge:``}),b({id:`back-top`,label:`BackTop`,route:`/back-top`,subtitle:``,badge:``}),b({id:`grid`,label:`Grid`,route:`/grid`,subtitle:``,badge:``}),b({id:`index-bar`,label:`IndexBar`,route:`/index-bar`,subtitle:``,badge:``}),b({id:`navbar`,label:`NavBar`,route:`/navbar`,subtitle:``,badge:``}),b({id:`pagination`,label:`Pagination`,route:`/pagination`,subtitle:``,badge:``}),b({id:`sidebar`,label:`Sidebar`,route:`/sidebar`,subtitle:``,badge:``}),b({id:`tabs`,label:`Tabs`,route:`/tabs`,subtitle:``,badge:`NEW`}),b({id:`tabbar`,label:`Tabbar`,route:`/tabbar`,subtitle:``,badge:``}),b({id:`tree-select`,label:`TreeSelect`,route:`/tree-select`,subtitle:``,badge:``})]}),c({id:`business`,title:`Business Components`,icon:`💼`,items:[b({id:`address-edit`,label:`AddressEdit`,route:`/address-edit`,subtitle:``,badge:``}),b({id:`address-list`,label:`AddressList`,route:`/address-list`,subtitle:``,badge:``}),b({id:`area`,label:`Area`,route:`/area`,subtitle:``,badge:``}),b({id:`card`,label:`Card`,route:`/card`,subtitle:``,badge:``}),b({id:`contact-card`,label:`ContactCard`,route:`/contact-card`,subtitle:``,badge:``}),b({id:`coupon`,label:`Coupon`,route:`/coupon`,subtitle:`List`,badge:``}),b({id:`submit-bar`,label:`SubmitBar`,route:`/submit-bar`,subtitle:``,badge:``})]}),c({id:`tools`,title:`Tools`,icon:`🛠️`,items:[b({id:`codes`,label:`QR & Barcodes`,route:`/codes`,subtitle:``,badge:`NEW`})]}),c({id:`animations`,title:`Wū Animations`,icon:`✨`,items:[b({id:`enter-exit`,label:`Enter/Exit`,route:`/animations/enter-exit`,subtitle:`Fade, Slide, Scale`,badge:`NEW`}),b({id:`gestures`,label:`Gestures`,route:`/animations/gestures`,subtitle:`Hover, Tap, Drag`,badge:``}),b({id:`scroll`,label:`Scroll`,route:`/animations/scroll`,subtitle:`Reveal on scroll`,badge:``}),b({id:`keyframes`,label:`Keyframes`,route:`/animations/keyframes`,subtitle:`Sequences`,badge:``}),b({id:`transforms`,label:`Transforms`,route:`/animations/transforms`,subtitle:`Rotate, Scale`,badge:``}),b({id:`spring`,label:`Spring`,route:`/animations/spring`,subtitle:`Physics-based`,badge:``}),b({id:`orchestration`,label:`Orchestration`,route:`/animations/orchestration`,subtitle:`Stagger, Delays`,badge:``})]})]},bf=(bg,bh)=>{return ((() => {
      for (let item of bg) {
        if (E(item, bh)) {
          return true
        }
      }

      return false
    })())},bi=(bj,bk)=>{return ((() => {
      const newSet = []

      bj.forEach((item) => {
        if (E(item, bk)) { return }
        newSet.push(item)
      })

      return newSet
    })())},bl=(bm,bn)=>{return (bf(bm,bn)?bm:((() => {
        const newSet = Array.from(bm)
        newSet.push(bn)

        return newSet
      })()))},bo=(bp)=>{return E(bp,``)},bq=(br)=>{return !bo(br)},BA=({bs=true})=>{const bt=F([]),bu=F(bd()),bv=()=>{return ((() => {
      setTimeout(() => {
        const currentPath = window.location.pathname;

        // Remover clase active de todos los links
        document.querySelectorAll('.sidebar a').forEach(link => {
          link.classList.remove('active');
        });

        // Agregar clase active al link actual
        const activeLink = document.querySelector('a[href="' + currentPath + '"]');
        if (activeLink) {
          activeLink.classList.add('active');

          const parentItem = activeLink.closest('[id^="sidebar-item-"]');
          if (parentItem) {
            parentItem.scrollIntoView({ behavior: 'smooth', block: 'center' });
          }
        }
      }, 100);
    })())},bw=(bx)=>{return (bf(bu.value,bx)?(()=>{bu.value=bi(bu.value,bx)})():(()=>{bu.value=bl(bu.value,bx)})())},by=(bz)=>{return bf(bu.value,bz)},ca=()=>{return ay()},cb=(cc)=>{return E(an.value,cc.id)},cd=(ce)=>{return G(`div`,{"id":`sidebar-item-` + ce.id,"data-route":ce.route,className:`hh`},[G(`a`,{"href":ce.route,"data-item-id":ce.id,"onClick":(cf)=>{return ca()},className:(cb(ce)?`active`:``) + ` hi`},[G(`span`,{},[ce.label,(bq(ce.subtitle)?G(`span`,{className:`hj`},[ce.subtitle]):null)]),(bq(ce.badge)?G(`span`,{className:`hk`},[ce.badge]):null)])])},cg=(ch)=>{return G(`div`,{className:`hd`},[G(`div`,{"onClick":(ci)=>{return bw(ch.id)},className:`he`},[G(`span`,{className:(by(ch.id)?`collapsed`:``) + ` hf`},[`▼`]),ch.icon,` `,ch.title]),G(`div`,{className:(by(ch.id)?`collapsed`:`expanded`) + ` hg`},[(()=>{const _0=[];const _1=ch.items;let _i=-1;for(let cj of _1){_i++;_0.push(cd(cj))};return _0})()])])};H(()=>{(()=>{bv();return (()=>{bt.value=be()})()})()},[]);I(()=>{bv();return u(null)});return G(J,{},[G(`div`,{"onClick":ca,className:(aw.value?`overlayVisible`:`overlayHidden`) + ` hl`}),G(`div`,{className:`sidebar ` + (bs?`fixed`:``) + ` ` + (aw.value?`sidebarOpen`:`sidebarClosed`) + ` hc`},[(()=>{const _0=[];const _1=bt.value;let _i=-1;for(let ck of _1){_i++;_0.push(cg(ck))};return _0})()])])},cl=()=>{return u(null)},BB=()=>{const cm=F(0),cn=F(0),co=F(0),cp=F(false),cq=()=>{const _={};(E(ah.value,`mobile`)?Object.assign(_,{[`--g-a`]:`56px`,[`--g-b`]:`-2px`}):null);return _},cr=()=>{const _={};(E(ah.value,`mobile`)?Object.assign(_,{[`--h-a`]:`20px`,[`--h-b`]:`32px`}):null);return _},cs=()=>{const _={};(E(ah.value,`mobile`)?Object.assign(_,{[`--i-a`]:`18px 48px`,[`--i-b`]:`16px`}):null);return _},ct=()=>{const _={};(E(ah.value,`mobile`)?Object.assign(_,{[`--j-a`]:`100px 20px`}):null);return _},cu=()=>{const _={};(E(ah.value,`mobile`)?Object.assign(_,{[`--k-a`]:`42px`}):null);return _},cv=()=>{const _={};(E(ah.value,`mobile`)?Object.assign(_,{[`--l-a`]:`18px`,[`--l-b`]:`30px`}):null);return _},cw=()=>{const _={};(E(ah.value,`mobile`)?Object.assign(_,{[`--m-a`]:`1fr`,[`--m-b`]:`40px`}):null);return _},cx=()=>{const _={};(E(ah.value,`mobile`)?Object.assign(_,{[`--n-a`]:`100px 20px`}):null);return _},cy=()=>{const _={};(E(ah.value,`mobile`)?Object.assign(_,{[`--o-a`]:`1fr`,[`--o-b`]:`60px`}):null);return _},cz=()=>{const _={};(E(ah.value,`mobile`)?Object.assign(_,{[`--p-a`]:`40px`}):null);return _},da=()=>{const _={};(E(ah.value,`mobile`)?Object.assign(_,{[`--q-a`]:`80px 20px`}):null);return _},db=()=>{const _={};(E(ah.value,`mobile`)?Object.assign(_,{[`--r-a`]:`repeat(2, 1fr)`,[`--r-b`]:`40px`}):null);return _},dc=()=>{const _={};(E(ah.value,`mobile`)?Object.assign(_,{[`--s-a`]:`64px`}):null);return _},dd=()=>{const _={};(E(ah.value,`mobile`)?Object.assign(_,{[`--t-a`]:`100px 20px`}):null);return _},de=()=>{const _={};(E(ah.value,`mobile`)?Object.assign(_,{[`--u-a`]:`48px`}):null);return _},df=()=>{const _={};(E(ah.value,`mobile`)?Object.assign(_,{[`--v-a`]:`20px`,[`--v-b`]:`60px`}):null);return _};H(()=>{(()=>{((() => {
      // Mouse tracking for interactive effects
      window.addEventListener('mousemove', (e) => {
        D(()=>{cm.value=(e.clientX);cn.value=(e.clientY)})
      });

      // Scroll tracking
      window.addEventListener('scroll', () => {
        (()=>{co.value=(window.scrollY)})()
      });

      // Intersection Observer for scroll animations
      const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
          if (entry.isIntersecting) {
            entry.target.classList.add('animate-in');
          }
        });
      }, { threshold: 0.1 });

      document.querySelectorAll('.animate-on-scroll').forEach(el => {
        observer.observe(el);
      });

      // Magnetic button effect
      document.querySelectorAll('.magnetic-btn').forEach(btn => {
        btn.addEventListener('mousemove', (e) => {
          const rect = btn.getBoundingClientRect();
          const x = e.clientX - rect.left - rect.width / 2;
          const y = e.clientY - rect.top - rect.height / 2;

          btn.style.transform = `translate(\${x * 0.3}px, \${y * 0.3}px)`;
        });

        btn.addEventListener('mouseleave', () => {
          btn.style.transform = 'translate(0, 0)';
        });
      });

      // Parallax layers
      window.addEventListener('scroll', () => {
        const scrolled = window.scrollY;
        document.querySelectorAll('.parallax-layer').forEach((layer, index) => {
          const speed = (index + 1) * 0.1;
          layer.style.transform = `translateY(\${scrolled * speed}px)`;
        });
      });

      // Cursor trail effect
      const canvas = document.getElementById('cursor-trail');
      const ctx = canvas.getContext('2d');
      canvas.width = window.innerWidth;
      canvas.height = window.innerHeight;

      const particles = [];
      const particleCount = 50;

      window.addEventListener('mousemove', (e) => {
        particles.push({
          x: e.clientX,
          y: e.clientY,
          size: Math.random() * 5 + 2,
          speedX: (Math.random() - 0.5) * 2,
          speedY: (Math.random() - 0.5) * 2,
          life: 1
        });

        if (particles.length > particleCount) {
          particles.shift();
        }
      });

      function animateParticles() {
        ctx.clearRect(0, 0, canvas.width, canvas.height);

        particles.forEach((particle, index) => {
          particle.x += particle.speedX;
          particle.y += particle.speedY;
          particle.life -= 0.02;
          particle.size *= 0.95;

          if (particle.life <= 0) {
            particles.splice(index, 1);
            return;
          }

          const gradient = ctx.createRadialGradient(
            particle.x, particle.y, 0,
            particle.x, particle.y, particle.size
          );
          gradient.addColorStop(0, `rgba(25, 137, 250, \${particle.life})`);
          gradient.addColorStop(1, `rgba(25, 137, 250, 0)`);

          ctx.fillStyle = gradient;
          ctx.beginPath();
          ctx.arc(particle.x, particle.y, particle.size, 0, Math.PI * 2);
          ctx.fill();
        });

        requestAnimationFrame(animateParticles);
      }

      animateParticles();

      window.addEventListener('resize', () => {
        canvas.width = window.innerWidth;
        canvas.height = window.innerHeight;
      });
    })());return cl()})()},[]);return G(`div`,{className:`fo`},[G(`canvas`,{"id":`cursor-trail`,className:`fp`}),G(`section`,{className:`fq`},[G(`div`,{className:`fr`},[G(`div`,{className:`parallax-layer` + ` fs ft`}),G(`div`,{className:`parallax-layer` + ` fs fu`}),G(`div`,{className:`parallax-layer` + ` fs fv`}),G(`div`,{className:`fw`})]),G(`div`,{className:`fx`},[G(`div`,{className:`animate-on-scroll` + ` fy`},[`KINETIC UI`]),G(`h1`,{className:`animate-on-scroll` + ` fz`,style:K([cq()])},[`Mint Wū`]),G(`p`,{className:`animate-on-scroll` + ` ga`,style:K([cr()])},[`Motion-first UI components that bring your interfaces to life. `,`Built for Mint Lang with fluid animations and interactive experiences.`]),G(`div`,{className:`gb`},[G(`button`,{className:`magnetic-btn` + ` gc gd`,style:K([cs()])},[`Start Creating`]),G(`button`,{className:`magnetic-btn` + ` gc ge`,style:K([cs()])},[`View Showcase`])])])]),G(`div`,{className:`gf`,style:K([ct()])},[G(`div`,{className:`animate-on-scroll` + ` gg`},[G(`h2`,{className:`gh`,style:K([cu()])},[`Built for Motion`]),G(`p`,{className:`gi`,style:K([cv()])},[`Every interaction designed to feel natural, responsive, and delightful`])]),G(`div`,{className:`gj`,style:K([cw()])},[G(`div`,{className:`animate-on-scroll` + ` gk`},[G(`span`,{className:`gl`},[`⚡`]),G(`h3`,{className:`gm`},[`Lightning Fast`]),G(`p`,{className:`gn`},[`60fps animations powered by GPU acceleration. Smooth performance even on low-end devices.`])]),G(`div`,{className:`animate-on-scroll` + ` gk`},[G(`span`,{className:`gl`},[`🎨`]),G(`h3`,{className:`gm`},[`Gesture Based`]),G(`p`,{className:`gn`},[`Natural touch interactions with spring physics and momentum scrolling built-in.`])]),G(`div`,{className:`animate-on-scroll` + ` gk`},[G(`span`,{className:`gl`},[`🎯`]),G(`h3`,{className:`gm`},[`Layout Aware`]),G(`p`,{className:`gn`},[`Automatic layout animations when elements resize, reorder, or change position.`])]),G(`div`,{className:`animate-on-scroll` + ` gk`},[G(`span`,{className:`gl`},[`🔮`]),G(`h3`,{className:`gm`},[`Scroll Magic`]),G(`p`,{className:`gn`},[`Parallax, reveal, and scroll-driven animations with precise control and easing.`])]),G(`div`,{className:`animate-on-scroll` + ` gk`},[G(`span`,{className:`gl`},[`✨`]),G(`h3`,{className:`gm`},[`Micro-interactions`]),G(`p`,{className:`gn`},[`Delightful details like magnetic buttons, ripple effects, and hover transformations.`])]),G(`div`,{className:`animate-on-scroll` + ` gk`},[G(`span`,{className:`gl`},[`🚀`]),G(`h3`,{className:`gm`},[`Page Transitions`]),G(`p`,{className:`gn`},[`Seamless route transitions with shared element animations and custom easing.`])])])]),G(`div`,{className:`go`,style:K([cx()])},[G(`div`,{className:`gp`,style:K([cy()])},[G(`div`,{className:`animate-on-scroll` + ` gq`},[G(`h2`,{className:`gr`,style:K([cz()])},[`Interactive By Default`]),G(`p`,{className:`gs`},[`Every component responds to your cursor, touch, and scroll. `,`Built with spring physics for natural motion that feels alive.`]),G(`button`,{className:`magnetic-btn` + ` gc gd`,style:K([cs()])},[`Explore Components`])]),G(`div`,{className:`animate-on-scroll` + ` gt`},[G(`div`,{style:K([`font-size: 120px;`])},[`🎨`])])])]),G(`div`,{className:`gu`,style:K([da()])},[G(`div`,{className:`gv`,style:K([db()])},[G(`div`,{className:`animate-on-scroll` + ` gw`},[G(`div`,{className:`gx`,style:K([dc()])},[`50+`]),G(`div`,{className:`gy`},[`Components`])]),G(`div`,{className:`animate-on-scroll` + ` gw`},[G(`div`,{className:`gx`,style:K([dc()])},[`60fps`]),G(`div`,{className:`gy`},[`Performance`])]),G(`div`,{className:`animate-on-scroll` + ` gw`},[G(`div`,{className:`gx`,style:K([dc()])},[`100%`]),G(`div`,{className:`gy`},[`Animated`])]),G(`div`,{className:`animate-on-scroll` + ` gw`},[G(`div`,{className:`gx`,style:K([dc()])},[`∞`]),G(`div`,{className:`gy`},[`Possibilities`])])])]),G(`div`,{className:`gz`,style:K([dd()])},[G(`h2`,{className:`animate-on-scroll` + ` ha`,style:K([de()])},[`Ready to Create Magic?`]),G(`p`,{className:`animate-on-scroll` + ` hb`,style:K([df()])},[`Start building beautiful, animated interfaces today`]),G(`div`,{className:`gb`},[G(`button`,{className:`magnetic-btn` + ` gc gd`,style:K([cs()])},[`Get Started Free`]),G(`button`,{className:`magnetic-btn` + ` gc ge`,style:K([cs()])},[`Browse Documentation`])])])])},dg=C(`https://mint-lang.com`),dh=(di,dj)=>{return ((() => {
      const text = di;
      const errorLevel = dj;

      // QR Code implementation using inline JavaScript
      // Based on QR Code specification

      // Error correction levels: L=7%, M=15%, Q=25%, H=30%
      const EC_LEVELS = { 'L': 1, 'M': 0, 'Q': 3, 'H': 2 };
      const ecLevel = EC_LEVELS[errorLevel] || EC_LEVELS['M'];

      // Determine version and mode
      const mode = 4; // Byte mode (supports all characters)
      let version = 1;
      const dataLength = text.length;

      // Calculate required version based on data length
      // Version 1-40, each version adds 4 modules
      const capacities = [
        17, 32, 53, 78, 106, 134, 154, 192, 230, 271,
        321, 367, 425, 458, 520, 586, 644, 718, 792, 858,
        929, 1003, 1091, 1171, 1273, 1367, 1465, 1528, 1628, 1732,
        1840, 1952, 2068, 2188, 2303, 2431, 2563, 2699, 2809, 2953
      ];

      for (let i = 0; i < capacities.length; i++) {
        if (dataLength <= capacities[i]) {
          version = i + 1;
          break;
        }
      }

      const size = 21 + (version - 1) * 4;

      // Initialize matrix
      const matrix = Array(size).fill(0).map(() => Array(size).fill(0));
      const reserved = Array(size).fill(0).map(() => Array(size).fill(false));

      // Add finder patterns (position detection patterns)
      const addFinderPattern = (row, col) => {
        for (let i = -1; i <= 7; i++) {
          for (let j = -1; j <= 7; j++) {
            const r = row + i;
            const c = col + j;
            if (r >= 0 && r < size && c >= 0 && c < size) {
              reserved[r][c] = true;
              if ((i >= 0 && i <= 6 && (j === 0 || j === 6)) ||
                  (j >= 0 && j <= 6 && (i === 0 || i === 6)) ||
                  (i >= 2 && i <= 4 && j >= 2 && j <= 4)) {
                matrix[r][c] = 1;
              }
            }
          }
        }
      };

      // Top-left, top-right, bottom-left finders
      addFinderPattern(0, 0);
      addFinderPattern(0, size - 7);
      addFinderPattern(size - 7, 0);

      // Add timing patterns
      for (let i = 8; i < size - 8; i++) {
        matrix[6][i] = reserved[6][i] = i % 2 === 0 ? 1 : 0;
        matrix[i][6] = reserved[i][6] = i % 2 === 0 ? 1 : 0;
        reserved[6][i] = reserved[i][6] = true;
      }

      // Add dark module
      matrix[size - 8][8] = 1;
      reserved[size - 8][8] = true;

      // Encode data
      const encodeData = () => {
        const bytes = [];

        // Mode indicator (4 bits) - Byte mode = 0100
        let bits = '0100';

        // Character count indicator (8 bits for byte mode, version 1-9)
        const charCountBits = version < 10 ? 8 : 16;
        bits += dataLength.toString(2).padStart(charCountBits, '0');

        // Data
        for (let i = 0; i < text.length; i++) {
          bits += text.charCodeAt(i).toString(2).padStart(8, '0');
        }

        // Terminator (up to 4 bits of 0)
        bits += '0000';

        // Pad to byte boundary
        while (bits.length % 8 !== 0) {
          bits += '0';
        }

        // Convert to bytes
        for (let i = 0; i < bits.length; i += 8) {
          bytes.push(parseInt(bits.substr(i, 8), 2));
        }

        // Add pad bytes
        const capacity = Math.floor((size * size - 200) / 8); // Approximate
        while (bytes.length < capacity) {
          bytes.push(bytes.length % 2 === 0 ? 236 : 17);
        }

        return bytes;
      };

      const dataBytes = encodeData();

      // Place data in matrix (zigzag pattern)
      let byteIndex = 0;
      let bitIndex = 7;

      for (let col = size - 1; col > 0; col -= 2) {
        if (col === 6) col--; // Skip timing column

        for (let row = 0; row < size; row++) {
          for (let c = 0; c < 2; c++) {
            const currentCol = col - c;
            const currentRow = (col + 1) % 4 < 2 ? size - 1 - row : row;

            if (!reserved[currentRow][currentCol]) {
              if (byteIndex < dataBytes.length) {
                const bit = (dataBytes[byteIndex] >> bitIndex) & 1;
                matrix[currentRow][currentCol] = bit;
                bitIndex--;
                if (bitIndex < 0) {
                  byteIndex++;
                  bitIndex = 7;
                }
              }
            }
          }
        }
      }

      // Convert matrix to string for easier handling
      return JSON.stringify(matrix);
    })())},dk=C(`M`),dl=C(``),dm=(dn)=>{return ((() => {
      const dataLength = dn.length;
      const capacities = [
        17, 32, 53, 78, 106, 134, 154, 192, 230, 271,
        321, 367, 425, 458, 520, 586, 644, 718, 792, 858,
        929, 1003, 1091, 1171, 1273, 1367, 1465, 1528, 1628, 1732,
        1840, 1952, 2068, 2188, 2303, 2431, 2563, 2699, 2809, 2953
      ];

      let version = 1;
      for (let i = 0; i < capacities.length; i++) {
        if (dataLength <= capacities[i]) {
          version = i + 1;
          break;
        }
      }

      return 21 + (version - 1) * 4;
    })())},dp=C(0),dq=(dr)=>{return D(()=>{dg.value=dr;dl.value=dh(dr,dk.value);dp.value=dm(dr)})},ds=(dt)=>{return D(()=>{dk.value=dt;dl.value=dh(dg.value,dt);dp.value=dm(dg.value)})},du=C(`MINT-LANG-2025`),dv=[`212222`,`222122`,`222221`,`121223`,`121322`,`131222`,`122213`,`122312`,`132212`,`221213`,`221312`,`231212`,`112232`,`122132`,`122231`,`113222`,`123122`,`123221`,`223211`,`221132`,`221231`,`213212`,`223112`,`312131`,`311222`,`321122`,`321221`,`312212`,`322112`,`322211`,`212123`,`212321`,`232121`,`111323`,`131123`,`131321`,`112313`,`132113`,`132311`,`211313`,`231113`,`231311`,`112133`,`112331`,`132131`,`113123`,`113321`,`133121`,`313121`,`211331`,`231131`,`213113`,`213311`,`213131`,`311123`,`311321`,`331121`,`312113`,`312311`,`332111`,`314111`,`221411`,`431111`,`111224`,`111422`,`121124`,`121421`,`141122`,`141221`,`112214`,`112412`,`122114`,`122411`,`142112`,`142211`,`241211`,`221114`,`413111`,`241112`,`134111`,`111242`,`121142`,`121241`,`114212`,`124112`,`124211`,`411212`,`421112`,`421211`,`212141`,`214121`,`412121`,`111143`,`111341`,`131141`,`114113`,`114311`,`411113`,`411311`,`113141`,`114131`,`311141`,`411131`,`211412`,`211214`,`211232`,`2331112`],dw=104,dx=106,dy=(dz)=>{return ((() => {
      const text = dz;
      const patterns = dv;
      const START_B = dw;
      const STOP = dx;

      // Convert text to character codes
      const charCodes = text.split('').map(char => char.charCodeAt(0) - 32);
      const codes = [START_B, ...charCodes];

      // Calculate checksum
      let sum = 0;
      for (let i = 0; i < codes.length; i++) {
        const weight = (i === 0) ? 1 : i;
        sum += codes[i] * weight;
      }
      const checksum = sum % 103;
      codes.push(checksum);
      codes.push(STOP);

      // Convert codes to pattern string
      const patternStr = codes.map(code => patterns[code] || '').join('');

      // Convert pattern to binary
      let binary = '';
      for (let i = 0; i < patternStr.length; i++) {
        const width = parseInt(patternStr[i]);
        const bit = (i % 2 === 0) ? '1' : '0';
        binary += bit.repeat(width);
      }

      return binary;
    })())},ea=C(``),eb=(ec)=>{return (dy(ec).length)},ed=C(0),ee=(ef)=>{return D(()=>{du.value=ef;ea.value=dy(ef);ed.value=eb(ef)})},eg=()=>{return D(()=>{dl.value=dh(dg.value,dk.value);dp.value=dm(dg.value)})},eh=()=>{return D(()=>{ea.value=dy(du.value);ed.value=eb(du.value)})},ei=()=>{return D(()=>{dl.value=dh(dg.value,dk.value);dp.value=dm(dg.value);ea.value=dy(du.value);ed.value=eb(du.value)})},ej=()=>{return [a({title:`Website URL`,content:`https://mint-lang.com`,description:`Escanea para visitar el sitio web oficial de Mint Lang`}),a({title:`Email Contact`,content:`mailto:contact@example.com?subject=Hello&body=Hi there!`,description:`Escanea para enviar un email preconfigurado`}),a({title:`WiFi Network`,content:`WIFI:T:WPA;S:MiRed;P:password123;H:false;;`,description:`Escanea para conectarte automáticamente a WiFi`}),a({title:`Phone Number`,content:`tel:+1234567890`,description:`Escanea para llamar directamente`}),a({title:`SMS Message`,content:`sms:+1234567890?body=Hello from Mint Lang!`,description:`Escanea para enviar SMS preconfigurado`}),a({title:`vCard Contact`,content:`BEGIN:VCARD\\nVERSION:3.0\\nFN:John Doe\\nTEL:+1234567890\\nEMAIL:john@example.com\\nEND:VCARD`,description:`Escanea para agregar contacto a tu teléfono`}),a({title:`Geolocation`,content:`geo:37.7749,-122.4194`,description:`Escanea para abrir ubicación en mapas (San Francisco)`}),a({title:`Event Calendar`,content:`BEGIN:VEVENT\\nSUMMARY:Mint Lang Workshop\\nDTSTART:20250201T100000\\nDTEND:20250201T120000\\nEND:VEVENT`,description:`Escanea para agregar evento al calendario`}),a({title:`Payment (Bitcoin)`,content:`bitcoin:1A1zP1eP5QGefi2DMPTfTL5SLmv7DivfNa?amount=0.001`,description:`Escanea para realizar pago con Bitcoin`}),a({title:`WhatsApp Message`,content:`https://wa.me/1234567890?text=Hello from Mint Lang!`,description:`Escanea para enviar mensaje de WhatsApp`}),a({title:`YouTube Video`,content:`https://www.youtube.com/watch?v=dQw4w9WgXcQ`,description:`Escanea para ver video en YouTube`}),a({title:`JSON Data`,content:`{\\"name\\":\\"Mint Lang\\",\\"type\\":\\"Programming Language\\",\\"year\\":2025}`,description:`Escanea para obtener datos JSON estructurados`})]},ek=()=>{return [a({title:`Product SKU`,content:`PROD-2025-001`,description:`Código de producto para inventario`}),a({title:`Order Number`,content:`ORD-20250104-ABC123`,description:`Número de orden para seguimiento`}),a({title:`Serial Number`,content:`SN-MINT-78945612`,description:`Número de serie de dispositivo`}),a({title:`License Plate`,content:`ABC-1234`,description:`Placa de vehículo`}),a({title:`Batch Code`,content:`BATCH-A-2025-01`,description:`Código de lote de producción`}),a({title:`Tracking Code`,content:`TRACK-XYZ-456789`,description:`Código de rastreo de paquete`}),a({title:`ISBN Book`,content:`ISBN-978-3-16-148410-0`,description:`Código ISBN de libro`}),a({title:`Membership ID`,content:`MEMBER-GOLD-9876`,description:`ID de membresía premium`}),a({title:`Ticket Number`,content:`TICKET-2025-A1B2C3`,description:`Número de ticket de evento`}),a({title:`Asset Tag`,content:`ASSET-IT-LAPTOP-042`,description:`Etiqueta de activo empresarial`}),a({title:`Coupon Code`,content:`DISCOUNT-50OFF-2025`,description:`Código de cupón de descuento`}),a({title:`Container ID`,content:`CONT-PORT-A-5678`,description:`ID de contenedor de carga`})]},BC=({el=8,em=4})=>{H(()=>{(()=>{return ((() => {
      setTimeout(() => {
        const canvas = document.querySelector('[data-qr-canvas]');
        if (!canvas) return;

        const ctx = canvas.getContext('2d');
        const matrix = JSON.parse(dl.value || '[]');
        const size = dp.value;
        const moduleSize = el;
        const quietZone = em;

        if (!matrix.length || !size) return;

        const canvasSize = (size + quietZone * 2) * moduleSize;
        canvas.width = canvasSize;
        canvas.height = canvasSize;

        ctx.fillStyle = '#FFFFFF';
        ctx.fillRect(0, 0, canvasSize, canvasSize);

        ctx.fillStyle = '#000000';
        for (let row = 0; row < size; row++) {
          for (let col = 0; col < size; col++) {
            if (matrix[row] && matrix[row][col] === 1) {
              ctx.fillRect(
                (col + quietZone) * moduleSize,
                (row + quietZone) * moduleSize,
                moduleSize,
                moduleSize
              );
            }
          }
        }
      }, 10);

      return Promise.resolve();
    })())})()},[]);I(()=>{return en()});return G(`canvas`,{"data-qr-canvas":`true`,className:`a`})},BD=({eo=100,ep=2})=>{H(()=>{(()=>{return ((() => {
      setTimeout(() => {
        const canvas = document.querySelector('[data-barcode-canvas]');
        if (!canvas) return;

        const ctx = canvas.getContext('2d');
        const pattern = ea.value;
        const barHeight = eo;
        const barWidth = ep;

        if (!pattern) return;

        const totalWidth = pattern.length * barWidth;
        canvas.width = totalWidth + 20;
        canvas.height = barHeight + 20;

        ctx.fillStyle = '#FFFFFF';
        ctx.fillRect(0, 0, canvas.width, canvas.height);

        ctx.fillStyle = '#000000';
        for (let i = 0; i < pattern.length; i++) {
          if (pattern[i] === '1') {
            ctx.fillRect(10 + i * barWidth, 10, barWidth, barHeight);
          }
        }
      }, 10);

      return Promise.resolve();
    })())})()},[]);I(()=>{return eq()});return G(`div`,{},[G(`canvas`,{"data-barcode-canvas":`true`,className:`b`}),G(`div`,{className:`c`},[du.value])])},BE=()=>{const er=F([]),es=F([]),et=(eu)=>{return dq(eu)},ev=(ew)=>{return ee(ew)},ex=(ey)=>{return G(`div`,{"onClick":(ez)=>{return et(ey.content)},className:`ai`},[G(`div`,{className:`aj`},[ey.title]),G(`div`,{className:`ak`},[ey.description]),G(`code`,{className:`al`},[ey.content])])},fa=(fb)=>{return G(`div`,{"onClick":(fc)=>{return ev(fb.content)},className:`ai`},[G(`div`,{className:`aj`},[fb.title]),G(`div`,{className:`ak`},[fb.description]),G(`code`,{className:`al`},[fb.content])])};H(()=>{(()=>{D(()=>{er.value=ej();es.value=ek()});return ei()})()},[]);return G(`div`,{className:`w`},[G(`div`,{className:`x`},[G(`h1`,{className:`y`},[`QR Codes & Barcodes`]),G(`p`,{className:`z`},[`Generate scannable QR codes and CODE128 barcodes in real-time`])]),G(`div`,{className:`aa`},[G(`div`,{className:`ab`},[G(`span`,{className:`ae`},[`📱`]),`QR Code Generator`,G(`span`,{className:`af`},[`Live`])]),G(`div`,{className:`ac`},[G(`div`,{},[G(`p`,{className:`ag`},[`📋 Current Content: `,dg.value]),G(`div`,{className:`am`},[`📚 Click an example to load:`]),G(`div`,{className:`ah`},[(()=>{const _0=[];const _1=er.value;let _i=-1;for(let fd of _1){_i++;_0.push(ex(fd))};return _0})()])]),G(`div`,{className:`ad`},[G(BC,{el:6,em:4})])])]),G(`div`,{className:`aa`},[G(`div`,{className:`ab`},[G(`span`,{className:`ae`},[`📊`]),`CODE128 Barcode Generator`,G(`span`,{className:`af`},[`Live`])]),G(`div`,{className:`ac`},[G(`div`,{},[G(`p`,{className:`ag`},[`📋 Current Text: `,du.value]),G(`div`,{className:`am`},[`📚 Click an example to load:`]),G(`div`,{className:`ah`},[(()=>{const _0=[];const _1=es.value;let _i=-1;for(let fe of _1){_i++;_0.push(fa(fe))};return _0})()])]),G(`div`,{className:`ad`},[G(BD,{eo:120,ep:3})])])])])},BF=()=>{const ff=(fg)=>{return y(fg)},fh=(fi)=>{return ad(fi)},fj=()=>{return ag()},fk=()=>{return af()},fl=(fm,fn,fo)=>{return G(`div`,{"onClick":(fp)=>{return ff(fm)},className:(E(t.value,fm)?`selected`:``) + ` k`},[G(`div`,{className:`l`,style:K([`background: ` + fo + `;`])}),G(`span`,{className:`m`},[fn])])},fq=(fr)=>{return G(`div`,{"onClick":(fs)=>{return fh(fr)},className:(E(aa.value,fr)?`selected`:``) + ` p`,style:K([`background: ` + fr + `;`])})};return G(`div`,{className:`d`},[G(`div`,{className:`e`},[G(`div`,{className:`f`},[G(`h2`,{className:`g`},[`Customize Theme`]),G(`div`,{className:`q`},[G(`button`,{"onClick":(ft)=>{return fj()},className:`r`},[`Reset`]),G(`button`,{"onClick":(fu)=>{return fk()},className:`primary` + ` r`},[`Apply Theme`])])]),G(`div`,{className:`h`},[G(`label`,{className:`i`},[`Theme Preset`]),G(`div`,{className:`j`},[fl(`default`,`Default`,`linear-gradient(135deg, #667eea 0%, #764ba2 100%)`),fl(`dark`,`Dark`,`#1a1a1a`),fl(`light`,`Light`,`#ffffff`),fl(`blue`,`Blue Ocean`,`linear-gradient(135deg, #1e3c72 0%, #2a5298 100%)`),fl(`green`,`Nature`,`linear-gradient(135deg, #134e5e 0%, #71b280 100%)`)])]),G(`div`,{className:`h`},[G(`label`,{className:`i`},[`Accent Color`]),G(`div`,{className:`n`},[G(`input`,{"type":`text`,"value":aa.value,className:`o`}),fq(`#1989fa`),fq(`#5a54f9`),fq(`#9e339f`),fq(`#ed4192`),fq(`#e0282e`),fq(`#f4801a`),fq(`#f2bd27`),fq(`#00b96b`)])])])])},BG=()=>{return G(`div`,{className:`s`},[G(`div`,{className:`t`},[G(`h1`,{className:`u`},[`Theme Customizer`]),G(`p`,{className:`v`},[`Customize your application theme with colors, radius, and presets. `,`Changes apply in real-time to preview your theme.`])]),G(BF,{})])},fv=()=>{return new T()},fw=(fx)=>{return (fx.length)},fy=(fz,ga)=>{return L(T,U,fz,ga)},gb=(gc,gd)=>{return M(gc,[[N(S,[O]),(ge)=>{return P(S)(gd(ge))}],[N(T,[]),()=>{return new T()}]])},gf=(gg,gh)=>{return Q(gg,gh,S,T)},gi=(gj)=>{return (gj.toString())},gk=(gl)=>{return (Math.floor(gl))},BH=({gm=[],gn=[],go=[],gp=fv(),gq=``,gr=`100%`,gs=`auto`,gt=false,gu=false,gv=false,gw=true,gx=true,gy=true})=>{const gz=F(false),ha=F(0),hb=F(0),hc=F(0),hd=F(1),he=F(1),hf=F(false),hg=F(0),hh=F(-1),hi=F(0),hj=F(true),hk=F(false),hl=F(false),hm=F(false),hn=F(false),ho=F(false),hp=F(false),hq=F(false),hr=F(false),hs=F(false),ht=F(false),hu=F(0),hv=F(false),hw=F(0),hx=F(0),hy=F(0),hz=F(0),ia=F(0),ib=F(0),ic=(id)=>{((() => {
      const video = document.querySelector('[data-pro-video]');
      if (video) {
        if (video.paused) {
          video.play();
        } else {
          video.pause();
        }
      }
    })());return (gx?(gz.value?D(()=>{gz.value=false;hz.value=hz.value + 1}):D(()=>{gz.value=true;hy.value=hy.value + 1})):(()=>{gz.value=!gz.value})())},ie=(ig)=>{return ih(ig)},ii=(ij)=>{((() => {
      const progressBar = event.currentTarget;
      const rect = progressBar.getBoundingClientRect();
      const x = event.clientX - rect.left;
      const percentage = x / rect.width;

      const video = document.querySelector('[data-pro-video]');
      if (video && video.duration) {
        video.currentTime = percentage * video.duration;
      }
    })());return (()=>{ia.value=ia.value + 1})()},ik=(il)=>{((() => {
      const progressBar = event.currentTarget;
      const rect = progressBar.getBoundingClientRect();
      const x = event.clientX - rect.left;
      const percentage = Math.max(0, Math.min(1, x / rect.width));

      const video = document.querySelector('[data-pro-video]');
      if (video && video.duration) {
        const time = percentage * video.duration;
        im((true),(time),(x))
      }
    })());return u(null)},io=(ip)=>{return (()=>{hv.value=false})()},iq=(ir)=>{return (()=>{hk.value=!hk.value})()},is=(it)=>{((() => {
      const video = document.querySelector('[data-pro-video]');
      if (video) {
        video.muted = !video.muted;
      }
    })());return D(()=>{hf.value=!hf.value;hd.value=(hf.value?1:0)})},iu=(iv)=>{return D(()=>{hl.value=!hl.value;hm.value=false;hn.value=false;hp.value=false})},iw=(ix)=>{((() => {
      const video = document.querySelector('[data-pro-video]');
      if (video) {
        video.playbackRate = ix;
      }
    })());return D(()=>{he.value=ix;hl.value=false})},iy=(iz)=>{return D(()=>{hm.value=!hm.value;hl.value=false;hn.value=false;hp.value=false})},ja=(jb)=>{((() => {
      const video = document.querySelector('[data-pro-video]');
      if (video) {
        const currentTime = video.currentTime;
        const wasPlaying = !video.paused;

        // Store time and state, then change source
        video.addEventListener('loadedmetadata', () => {
          video.currentTime = currentTime;
          if (wasPlaying) {
            video.play();
          }
        }, { once: true });
      }
    })());return D(()=>{hg.value=jb;hm.value=false;ib.value=ib.value + 1})},jc=(jd)=>{return D(()=>{hn.value=!hn.value;hl.value=false;hm.value=false;hp.value=false})},je=(jf)=>{((() => {
      const video = document.querySelector('[data-pro-video]');
      if (video) {
        const tracks = video.textTracks;
        for (let i = 0; i < tracks.length; i++) {
          tracks[i].mode = i === jf ? 'showing' : 'hidden';
        }
      }
    })());return D(()=>{hh.value=jf;hn.value=false})},ih=(jg)=>{((() => {
      const container = document.querySelector('[data-pro-container]');
      if (container) {
        if (!document.fullscreenElement) {
          container.requestFullscreen().catch(err => {
            console.error('Fullscreen error:', err);
          });
        } else {
          document.exitFullscreen();
        }
      }
    })());return (()=>{hq.value=!hq.value})()},jh=(ji)=>{((() => {
      const video = document.querySelector('[data-pro-video]');
      if (video && document.pictureInPictureEnabled) {
        if (!document.pictureInPictureElement) {
          video.requestPictureInPicture().catch(err => {
            console.error('PiP error:', err);
          });
        } else {
          document.exitPictureInPicture();
        }
      }
    })());return u(null)},jj=(jk)=>{return (()=>{hr.value=!hr.value})()},jl=(jm)=>{return (()=>{hr.value=false})()},jn=(jo)=>{return (()=>{ho.value=!ho.value})()},jp=(jq)=>{return D(()=>{hi.value=jq;ho.value=false})},jr=(js)=>{const jt=(hi.value < fw(gm) - 1?hi.value + 1:0);return (()=>{hi.value=jt})()},ju=(jv)=>{const jw=(hi.value > 0?hi.value - 1:fw(gm) - 1);return (()=>{hi.value=jw})()},jx=(jy)=>{return (()=>{hj.value=true})()},jz=(ka)=>{return (gz.value?D(()=>{hj.value=false;hk.value=false}):u(null))},kb=(kc)=>{return (()=>{hj.value=true})()},kd=(ke,kf,kg,kh)=>{return D(()=>{ha.value=ke;hb.value=kf;hc.value=kg;hs.value=kh})},ki=(kj)=>{return (()=>{gz.value=kj})()},kk=(kl)=>{return (()=>{hd.value=kl})()},km=(kn)=>{return (()=>{hs.value=kn})()},ko=(kp)=>{return (()=>{hq.value=kp})()},im=(kq,kr,ks)=>{return D(()=>{hv.value=kq;hu.value=kr;hw.value=ks})},kt=()=>{return ((() => {
      const video = document.querySelector('[data-pro-video]');
      if (video) {
        const currentTime = video.currentTime || 0;
        const duration = video.duration || 0;
        const isLoading = video.readyState < 3;

        // Calculate buffered
        let bufferedEnd = 0;
        if (video.buffered.length > 0) {
          bufferedEnd = video.buffered.end(video.buffered.length - 1);
        }

        kd((currentTime),(duration),(bufferedEnd),(isLoading))
      }
    })())},ku=()=>{return (fw(gm) > 0?kv():(gv?(()=>{((() => {
        const video = document.querySelector('[data-pro-video]');
        if (video) {
          video.currentTime = 0;
          video.play();
        }
      })());return u(null)})():(()=>{gz.value=false})()))},kv=()=>{const kw=(hi.value < fw(gm) - 1?hi.value + 1:0);return (()=>{hi.value=kw})()},kx=(ky)=>{const kz=gk(ky / 3600);const la=gk((ky % 3600) / 60);const lb=gk(ky % 60);const lc=(la < 10?`0` + gi(la):gi(la));const ld=(lb < 10?`0` + gi(lb):gi(lb));return (kz > 0?gi(kz) + `:` + lc + `:` + ld:gi(la) + `:` + ld)},le=()=>{return (hb.value > 0?(ha.value / hb.value) * 100:0)},lf=()=>{return (hb.value > 0?(hc.value / hb.value) * 100:0)},lg=()=>{return (fw(gn) > 0?fy(gb(gf(gn,hg.value),(lh)=>{return lh.src}),``):(fw(gm) > 0?fy(gb(gf(gm,hi.value),(li)=>{return li.src}),``):``))},lj=()=>{return (fw(gm) > 0?fy(gb(gf(gm,hi.value),(lk)=>{return lk.poster}),gq):gq)},ll=()=>{return (hf.value || E(hd.value,0)?`🔇`:(hd.value > 0.5?`🔊`:`🔉`))},lm=()=>{const _={[`--b-a`]:gr,[`--b-b`]:gs};return _};H(()=>{(()=>{((() => {
      const video = document.querySelector('[data-pro-video]');
      const container = document.querySelector('[data-pro-container]');

      if (video) {
        // Time update
        video.addEventListener('timeupdate', () => {
          kt()
        });

        // Metadata loaded
        video.addEventListener('loadedmetadata', () => {
          kt()
        });

        // Waiting/buffering
        video.addEventListener('waiting', () => {
          km((true))
        });

        // Can play
        video.addEventListener('canplay', () => {
          km((false))
        });

        // Ended
        video.addEventListener('ended', () => {
          ku()
        });

        // Volume change
        video.addEventListener('volumechange', () => {
          kk((video.volume))
        });

        // Play/Pause
        video.addEventListener('play', () => {
          ki((true))
        });

        video.addEventListener('pause', () => {
          ki((false))
        });
      }

      // Keyboard events
      if (gw) {
        document.addEventListener('keydown', (event) => {
          if (document.activeElement === document.body ||
              document.activeElement.tagName === 'VIDEO') {
            const key = event.key;
            const video = document.querySelector('[data-pro-video]');
            if (!video) return;

            event.preventDefault();

            switch(key) {
              case ' ':
              case 'k':
                // Play/Pause
                if (video.paused) {
                  video.play();
                } else {
                  video.pause();
                }
                break;

              case 'ArrowLeft':
                // Seek backward 5s
                video.currentTime = Math.max(0, video.currentTime - 5);
                break;

              case 'ArrowRight':
                // Seek forward 5s
                video.currentTime = Math.min(video.duration, video.currentTime + 5);
                break;

              case 'ArrowUp':
                // Volume up 10%
                video.volume = Math.min(1, video.volume + 0.1);
                break;

              case 'ArrowDown':
                // Volume down 10%
                video.volume = Math.max(0, video.volume - 0.1);
                break;

              case 'f':
                // Fullscreen
                const container = document.querySelector('[data-pro-container]');
                if (!document.fullscreenElement) {
                  container.requestFullscreen();
                } else {
                  document.exitFullscreen();
                }
                break;

              case 'm':
                // Mute
                video.muted = !video.muted;
                break;

              case 'j':
                // Seek backward 10s
                video.currentTime = Math.max(0, video.currentTime - 10);
                break;

              case 'l':
                // Seek forward 10s
                video.currentTime = Math.min(video.duration, video.currentTime + 10);
                break;

              case 'Home':
                // Jump to start
                video.currentTime = 0;
                break;

              case 'End':
                // Jump to end
                video.currentTime = video.duration;
                break;

              case '0':
              case '1':
              case '2':
              case '3':
              case '4':
              case '5':
              case '6':
              case '7':
              case '8':
              case '9':
                // Jump to percentage
                const percent = parseInt(key) * 10;
                video.currentTime = (percent / 100) * video.duration;
                break;

              case '<':
              case ',':
                // Decrease playback speed
                video.playbackRate = Math.max(0.25, video.playbackRate - 0.25);
                break;

              case '>':
              case '.':
                // Increase playback speed
                video.playbackRate = Math.min(2, video.playbackRate + 0.25);
                break;
            }
          }
        });
      }

      // Fullscreen change
      document.addEventListener('fullscreenchange', () => {
        const isFs = !!document.fullscreenElement;
        ko((isFs))
      });
    })());return u(null)})()},[]);return G(`div`,{"data-pro-container":`true`,"onMouseEnter":jx,"onMouseLeave":jz,"onMouseMove":kb,"onDoubleClick":ie,className:(hq.value?`fullscreen`:(hr.value?`mini`:``)) + ` as`,style:K([lm()])},[(hr.value?G(`div`,{className:`cc`},[G(`button`,{"onClick":jj,"title":`Restore`,className:`cd`},[`⛶`]),G(`button`,{"onClick":jl,"title":`Close`,className:`cd`},[`✕`])]):null),G(`video`,{"data-pro-video":`true`,"src":lg(),"poster":lj(),className:`at`},[(()=>{const _0=[];const _1=go;let _i=-1;for(let ln of _1){_i++;_0.push((ln.isDefault?G(`track`,{"label":ln.label,"kind":`subtitles`,"srcLang":ln.language,"src":ln.src,"default":`true`}):G(`track`,{"label":ln.label,"kind":`subtitles`,"srcLang":ln.language,"src":ln.src})))};return _0})()]),(hs.value?G(`div`,{className:`au`},[G(`div`,{className:`av`})]):null),(!gz.value && !hr.value?G(`div`,{className:`aw ax`},[G(`button`,{"onClick":ic,className:`ay`},[`▶`])]):null),G(`div`,{className:`az`,style:K([(hj.value || !gz.value?`opacity: 1`:`opacity: 0`)])},[G(`div`,{className:`ba`},[G(`div`,{"onClick":ii,"onMouseMove":ik,"onMouseLeave":io,className:`bb`},[G(`div`,{className:(hv.value?`progressBarHover`:``) + ` bc`},[G(`div`,{className:`bd`,style:K([`width: ` + gi(lf()) + `%`])}),G(`div`,{className:`be`,style:K([`width: ` + gi(le()) + `%`])},[G(`div`,{className:(hv.value?`thumbVisible`:``) + ` bf`})])]),(hv.value?G(`div`,{className:`bg bh`,style:K([`left: ` + gi(hw.value) + `px`])},[G(`div`,{className:`bi`}),G(`div`,{className:`bj`},[kx(hu.value)])]):null)])]),G(`div`,{className:`bk`},[G(`button`,{"onClick":ic,"title":`Play/Pause (Space)`,className:`bl`},[(gz.value?`⏸`:`▶`)]),(fw(gm) > 1?G(`button`,{"onClick":ju,"title":`Previous`,className:`bl`},[`⏮`]):null),(fw(gm) > 1?G(`button`,{"onClick":jr,"title":`Next`,className:`bl`},[`⏭`]):null),G(`div`,{"onMouseEnter":iq,"onMouseLeave":iq,className:`bm`},[G(`button`,{"onClick":is,"title":`Mute (M)`,className:`bl`},[ll()]),G(`div`,{className:(hk.value?`visible`:``) + ` bn`},[G(`div`,{className:`bo`},[G(`div`,{className:`bp`,style:K([`width: ` + gi(hd.value * 100) + `%`])})])])]),G(`div`,{className:`bq`},[kx(ha.value),` / `,kx(hb.value)]),G(`div`,{className:`br`}),(fw(go) > 0 && !hr.value?G(`div`,{style:K([`position: relative;`])},[G(`button`,{"onClick":jc,"title":`Captions`,className:`bl`},[`CC`]),(hn.value?G(`div`,{className:`bs`},[G(`div`,{"onClick":(lo)=>{return je(-1)},className:(E(hh.value,-1)?`active`:``) + ` bt`},[`Off`]),(()=>{const _0=[];const _1=go;let _i=-1;for(let lp of _1){_i++;const lq=_i;_0.push(G(`div`,{"onClick":(lr)=>{return je(lq)},className:(E(hh.value,lq)?`active`:``) + ` bt`},[lp.label,(E(hh.value,lq)?G(`span`,{className:`bu`},[`✓`]):null)]))};return _0})()]):null)]):null),(fw(gn) > 1 && !hr.value?G(`div`,{style:K([`position: relative;`])},[G(`button`,{"onClick":iy,"title":`Quality`,className:`bl`},[`⚙`]),(hm.value?G(`div`,{className:`bs`},[(()=>{const _0=[];const _1=gn;let _i=-1;for(let ls of _1){_i++;const lt=_i;_0.push(G(`div`,{"onClick":(lu)=>{return ja(lt)},className:(E(hg.value,lt)?`active`:``) + ` bt`},[ls.label,(E(hg.value,lt)?G(`span`,{className:`bu`},[`✓`]):null)]))};return _0})()]):null)]):null),(!hr.value?G(`div`,{style:K([`position: relative;`])},[G(`button`,{"onClick":iu,"title":`Speed`,className:`bl`},[(E(he.value,1)?`1x`:gi(he.value) + `x`)]),(hl.value?G(`div`,{className:`bs`},[G(`div`,{"onClick":(lv)=>{return iw(0.25)},className:(E(he.value,0.25)?`active`:``) + ` bt`},[`0.25x`]),G(`div`,{"onClick":(lw)=>{return iw(0.5)},className:(E(he.value,0.5)?`active`:``) + ` bt`},[`0.5x`]),G(`div`,{"onClick":(lx)=>{return iw(0.75)},className:(E(he.value,0.75)?`active`:``) + ` bt`},[`0.75x`]),G(`div`,{"onClick":(ly)=>{return iw(1)},className:(E(he.value,1)?`active`:``) + ` bt`},[`Normal`]),G(`div`,{"onClick":(lz)=>{return iw(1.25)},className:(E(he.value,1.25)?`active`:``) + ` bt`},[`1.25x`]),G(`div`,{"onClick":(ma)=>{return iw(1.5)},className:(E(he.value,1.5)?`active`:``) + ` bt`},[`1.5x`]),G(`div`,{"onClick":(mb)=>{return iw(1.75)},className:(E(he.value,1.75)?`active`:``) + ` bt`},[`1.75x`]),G(`div`,{"onClick":(mc)=>{return iw(2)},className:(E(he.value,2)?`active`:``) + ` bt`},[`2x`])]):null)]):null),(fw(gm) > 0 && !hr.value?G(`button`,{"onClick":jn,"title":`Playlist`,className:`bl`},[`☰`]):null),(gy && !hq.value && !hr.value?G(`button`,{"onClick":jj,"title":`Mini Player`,className:`bl`},[`⧉`]):null),(!hr.value?G(`button`,{"onClick":jh,"title":`Picture-in-Picture`,className:`bl`},[`⧉`]):null),(!hr.value?G(`button`,{"onClick":ih,"title":`Fullscreen (F)`,className:`bl`},[(hq.value?`⛶`:`⛶`)]):null)])]),(fw(gm) > 0?G(`div`,{className:`bv`,style:K([(ho.value?`transform: translateX(0)`:``)])},[G(`div`,{className:`bw`},[`Playlist (`,gi(fw(gm)),` videos)`]),(()=>{const _0=[];const _1=gm;let _i=-1;for(let md of _1){_i++;const me=_i;_0.push(G(`div`,{"onClick":(mf)=>{return jp(me)},className:(E(hi.value,me)?`active`:``) + ` bx`},[G(`img`,{"src":md.poster,"alt":md.title,className:`by`}),G(`div`,{className:`bz`},[G(`div`,{className:`ca`},[md.title]),G(`div`,{className:`cb`},[kx(md.duration)])])]))};return _0})()]):null)])},mg=(mh,mi)=>{return (mh.includes(mi))},BI=({mj=``,mk=`100%`,ml=`500px`,mm=false,mn=false,mo=true})=>{const mp=F(``),mq=F(``),mr=()=>{const ms=mt(mj);return D(()=>{mp.value=ms.platform;mq.value=ms.videoId})},mt=(mu)=>{return (mg(mu,`youtube.com`) || mg(mu,`youtu.be`)?f({platform:`youtube`,videoId:mv(mu)}):(mg(mu,`vimeo.com`)?f({platform:`vimeo`,videoId:mw(mu)}):(mg(mu,`dailymotion.com`) || mg(mu,`dai.ly`)?f({platform:`dailymotion`,videoId:mx(mu)}):f({platform:`unknown`,videoId:``}))))},mv=(my)=>{return ((() => {
      const url = my;
      let videoId = '';

      // Standard youtube.com URL
      if (url.includes('youtube.com/watch?v=')) {
        videoId = url.split('v=')[1]?.split('&')[0] || '';
      }
      // Short youtu.be URL
      else if (url.includes('youtu.be/')) {
        videoId = url.split('youtu.be/')[1]?.split('?')[0] || '';
      }
      // Embed URL
      else if (url.includes('youtube.com/embed/')) {
        videoId = url.split('embed/')[1]?.split('?')[0] || '';
      }

      return videoId;
    })())},mw=(mz)=>{return ((() => {
      const url = mz;
      let videoId = '';

      // Standard vimeo.com URL
      if (url.includes('vimeo.com/')) {
        const parts = url.split('vimeo.com/');
        if (parts[1]) {
          videoId = parts[1].split('/')[0].split('?')[0] || '';
        }
      }

      return videoId;
    })())},mx=(na)=>{return ((() => {
      const url = na;
      let videoId = '';

      // Standard dailymotion.com URL
      if (url.includes('dailymotion.com/video/')) {
        videoId = url.split('video/')[1]?.split('_')[0] || '';
      }
      // Short dai.ly URL
      else if (url.includes('dai.ly/')) {
        videoId = url.split('dai.ly/')[1]?.split('?')[0] || '';
      }

      return videoId;
    })())},nb=()=>{const nc=(mm?`1`:`0`);const nd=(mn?`1`:`0`);const ne=(mo?`1`:`0`);return M(mp.value,[[`youtube`,()=>{return `https://www.youtube.com/embed/` + mq.value + `?autoplay=` + nc + `&mute=` + nd + `&controls=` + ne}],[`vimeo`,()=>{return `https://player.vimeo.com/video/` + mq.value + `?autoplay=` + nc + `&muted=` + nd + `&controls=` + ne}],[`dailymotion`,()=>{return `https://www.dailymotion.com/embed/video/` + mq.value + `?autoplay=` + nc + `&mute=` + nd + `&controls=` + ne}],[null,()=>{return ``}]])},nf=()=>{const _={[`--a-a`]:mk,[`--a-b`]:ml};return _};H(()=>{(()=>{return mr()})()},[]);I(()=>{return mr()});return G(`div`,{className:`an`,style:K([nf()])},[(bq(mq.value) && bq(mp.value)?G(`iframe`,{"src":nb(),"allow":`accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture`,"allowfullscreen":`true`,className:`ao`}):(bo(mj)?G(`div`,{className:`ap`},[G(`div`,{className:`aq`},[`🎬`]),G(`div`,{className:`ar`},[`Enter a video URL to start`]),G(`div`,{style:K([`font-size: 12px; color: var(--text-color, #999);`])},[`Supports YouTube, Vimeo, and Dailymotion`])]):G(`div`,{className:`ap`},[G(`div`,{className:`aq`},[`⚠️`]),G(`div`,{className:`ar`},[`Unsupported video platform`]),G(`div`,{style:K([`font-size: 12px; color: var(--text-color, #999);`])},[`Please use YouTube, Vimeo, or Dailymotion URLs`])])))])},BJ=()=>{return G(`div`,{className:`ce`},[G(`div`,{className:`cf`},[G(`h1`,{className:`cg`},[`🎬 Video Players`]),G(`p`,{className:`ch`},[`Professional video player with all advanced features: keyboard shortcuts, playlist, quality selector, subtitles, analytics, mini-player, PiP, and external platform support (YouTube, Vimeo)`])]),G(`div`,{className:`ci`},[G(`h2`,{className:`cj`},[`🚀 Pro Video Player`,G(`span`,{className:`cu`},[`Ultimate`])]),G(`div`,{className:`ck`},[G(`div`,{className:`cm`},[G(`h3`,{className:`cn`},[`Full-Featured Professional Player with Playlist`]),G(BH,{gn:[e({label:`1080p`,src:`https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4`,height:1080}),e({label:`720p`,src:`https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4`,height:720}),e({label:`480p`,src:`https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4`,height:480})],go:[d({label:`English`,src:`/captions/en.vtt`,language:`en`,isDefault:true})],gm:[g({id:`1`,title:`Big Buck Bunny`,src:`https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4`,poster:`https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg`,duration:596}),g({id:`2`,title:`Elephants Dream`,src:`https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4`,poster:`https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ElephantsDream.jpg`,duration:653}),g({id:`3`,title:`For Bigger Blazes`,src:`https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4`,poster:`https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerBlazes.jpg`,duration:15})],gq:`https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg`,gr:`100%`,gs:`600px`,gw:true,gx:true}),G(`p`,{className:`ct`},[`🔥 Professional player with: Keyboard shortcuts (Space, ←→ seek, ↑↓ volume, F fullscreen, M mute, J/L 10s jumps, 0-9 percentage jumps), seek preview, buffer indicator, playlist, mini-player mode, analytics tracking, and all controls!`])]),G(`div`,{className:`cm`},[G(`h3`,{className:`cn`},[`Pro Player - Single Video with Auto-play`]),G(BH,{gn:[e({label:`HD`,src:`https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4`,height:720})],gq:`https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerJoyrides.jpg`,gr:`100%`,gs:`500px`,gt:true,gu:true,gw:true}),G(`p`,{className:`ct`},[`⚡ All pro features in a single video configuration`])])])]),G(`div`,{className:`ci`},[G(`h2`,{className:`cj`},[`🌐 Embed Player (YouTube, Vimeo, Dailymotion)`,G(`span`,{className:`cu`},[`External`])]),G(`div`,{className:`cl`},[G(`div`,{className:`cm`},[G(`h3`,{className:`cn`},[`YouTube Video`]),G(BI,{mj:`https://www.youtube.com/watch?v=dQw4w9WgXcQ`,mk:`100%`,ml:`400px`,mo:true}),G(`p`,{className:`ct`},[`📺 Supports standard YouTube URLs, short URLs (youtu.be), and embed URLs`])]),G(`div`,{className:`cm`},[G(`h3`,{className:`cn`},[`Vimeo Video`]),G(BI,{mj:`https://vimeo.com/148751763`,mk:`100%`,ml:`400px`,mo:true}),G(`p`,{className:`ct`},[`🎬 Clean Vimeo player integration with responsive design`])])])]),G(`div`,{className:`ci`},[G(`h2`,{className:`cj`},[`✨ Feature Comparison`]),G(`table`,{className:`cv`},[G(`thead`,{},[G(`tr`,{},[G(`th`,{className:`cw`},[`Feature`]),G(`th`,{className:`cw`},[`ProVideoPlayer`]),G(`th`,{className:`cw`},[`EmbedPlayer`])])]),G(`tbody`,{},[G(`tr`,{},[G(`td`,{className:`cx`},[`Play/Pause`]),G(`td`,{className:`cx`},[G(`span`,{className:`cy`},[`✓`])]),G(`td`,{className:`cx`},[G(`span`,{className:`cy`},[`✓`])])]),G(`tr`,{},[G(`td`,{className:`cx`},[`Progress Bar with Preview`]),G(`td`,{className:`cx`},[G(`span`,{className:`cy`},[`✓ Hover preview`])]),G(`td`,{className:`cx`},[G(`span`,{className:`cy`},[`✓`])])]),G(`tr`,{},[G(`td`,{className:`cx`},[`Volume Control`]),G(`td`,{className:`cx`},[G(`span`,{className:`cy`},[`✓ Slider + Mute`])]),G(`td`,{className:`cx`},[G(`span`,{className:`cy`},[`✓`])])]),G(`tr`,{},[G(`td`,{className:`cx`},[`Playback Speed`]),G(`td`,{className:`cx`},[G(`span`,{className:`cy`},[`✓ (0.25x - 2x)`])]),G(`td`,{className:`cx`},[`Platform-dependent`])]),G(`tr`,{},[G(`td`,{className:`cx`},[`Quality Selector`]),G(`td`,{className:`cx`},[G(`span`,{className:`cy`},[`✓ Multi-source`])]),G(`td`,{className:`cx`},[`Platform-dependent`])]),G(`tr`,{},[G(`td`,{className:`cx`},[`Subtitles/Captions`]),G(`td`,{className:`cx`},[G(`span`,{className:`cy`},[`✓ VTT format`])]),G(`td`,{className:`cx`},[G(`span`,{className:`cy`},[`✓`])])]),G(`tr`,{},[G(`td`,{className:`cx`},[`Fullscreen`]),G(`td`,{className:`cx`},[G(`span`,{className:`cy`},[`✓ + Double-click`])]),G(`td`,{className:`cx`},[G(`span`,{className:`cy`},[`✓`])])]),G(`tr`,{},[G(`td`,{className:`cx`},[`Picture-in-Picture`]),G(`td`,{className:`cx`},[G(`span`,{className:`cy`},[`✓`])]),G(`td`,{className:`cx`},[`Browser-dependent`])]),G(`tr`,{},[G(`td`,{className:`cx`},[`Keyboard Shortcuts`]),G(`td`,{className:`cx`},[G(`span`,{className:`cy`},[`✓ (15+ keys)`])]),G(`td`,{className:`cx`},[`Platform-dependent`])]),G(`tr`,{},[G(`td`,{className:`cx`},[`Buffer Indicator`]),G(`td`,{className:`cx`},[G(`span`,{className:`cy`},[`✓ Visual bar`])]),G(`td`,{className:`cx`},[`Platform-dependent`])]),G(`tr`,{},[G(`td`,{className:`cx`},[`Playlist Support`]),G(`td`,{className:`cx`},[G(`span`,{className:`cy`},[`✓ Auto-advance`])]),G(`td`,{className:`cx`},[`✗`])]),G(`tr`,{},[G(`td`,{className:`cx`},[`Mini-Player`]),G(`td`,{className:`cx`},[G(`span`,{className:`cy`},[`✓ Floating mode`])]),G(`td`,{className:`cx`},[`✗`])]),G(`tr`,{},[G(`td`,{className:`cx`},[`Analytics Tracking`]),G(`td`,{className:`cx`},[G(`span`,{className:`cy`},[`✓ 5 metrics`])]),G(`td`,{className:`cx`},[`✗`])]),G(`tr`,{},[G(`td`,{className:`cx`},[`Loading State`]),G(`td`,{className:`cx`},[G(`span`,{className:`cy`},[`✓ Spinner`])]),G(`td`,{className:`cx`},[`Platform-dependent`])]),G(`tr`,{},[G(`td`,{className:`cx`},[`Theme Integration`]),G(`td`,{className:`cx`},[G(`span`,{className:`cy`},[`✓`])]),G(`td`,{className:`cx`},[G(`span`,{className:`cy`},[`✓`])])]),G(`tr`,{},[G(`td`,{className:`cx`},[`External Platforms`]),G(`td`,{className:`cx`},[`✗`]),G(`td`,{className:`cx`},[G(`span`,{className:`cy`},[`✓ YouTube, Vimeo`])])])])])]),G(`div`,{className:`ci`},[G(`h2`,{className:`cj`},[`🎯 All Features`]),G(`div`,{className:`co`},[G(`div`,{className:`cp`},[G(`div`,{className:`cq`},[`▶️`]),G(`h3`,{className:`cr`},[`Play/Pause`]),G(`p`,{className:`cs`},[`Smooth playback control with visual feedback`])]),G(`div`,{className:`cp`},[G(`div`,{className:`cq`},[`⏱️`]),G(`h3`,{className:`cr`},[`Speed Control`]),G(`p`,{className:`cs`},[`0.25x to 2x playback speed`])]),G(`div`,{className:`cp`},[G(`div`,{className:`cq`},[`🔊`]),G(`h3`,{className:`cr`},[`Volume`]),G(`p`,{className:`cs`},[`Slider control with mute toggle`])]),G(`div`,{className:`cp`},[G(`div`,{className:`cq`},[`⚙️`]),G(`h3`,{className:`cr`},[`Quality`]),G(`p`,{className:`cs`},[`Multiple quality options`])]),G(`div`,{className:`cp`},[G(`div`,{className:`cq`},[`CC`]),G(`h3`,{className:`cr`},[`Subtitles`]),G(`p`,{className:`cs`},[`VTT caption track support`])]),G(`div`,{className:`cp`},[G(`div`,{className:`cq`},[`⛶`]),G(`h3`,{className:`cr`},[`Fullscreen`]),G(`p`,{className:`cs`},[`Native fullscreen API`])]),G(`div`,{className:`cp`},[G(`div`,{className:`cq`},[`⧉`]),G(`h3`,{className:`cr`},[`PiP Mode`]),G(`p`,{className:`cs`},[`Picture-in-Picture support`])]),G(`div`,{className:`cp`},[G(`div`,{className:`cq`},[`🎨`]),G(`h3`,{className:`cr`},[`Theming`]),G(`p`,{className:`cs`},[`Full CSS variable support`])]),G(`div`,{className:`cp`},[G(`div`,{className:`cq`},[`⌨️`]),G(`h3`,{className:`cr`},[`Keyboard`]),G(`p`,{className:`cs`},[`Space, arrows shortcuts`])]),G(`div`,{className:`cp`},[G(`div`,{className:`cq`},[`📱`]),G(`h3`,{className:`cr`},[`Responsive`]),G(`p`,{className:`cs`},[`Mobile-friendly design`])]),G(`div`,{className:`cp`},[G(`div`,{className:`cq`},[`🌐`]),G(`h3`,{className:`cr`},[`Embeds`]),G(`p`,{className:`cs`},[`YouTube, Vimeo, Dailymotion`])]),G(`div`,{className:`cp`},[G(`div`,{className:`cq`},[`⚡`]),G(`h3`,{className:`cr`},[`Performance`]),G(`p`,{className:`cs`},[`Optimized HTML5 video`])]),G(`div`,{className:`cp`},[G(`div`,{className:`cq`},[`🎮`]),G(`h3`,{className:`cr`},[`Playlist`]),G(`p`,{className:`cs`},[`Auto-advance queue system`])]),G(`div`,{className:`cp`},[G(`div`,{className:`cq`},[`📊`]),G(`h3`,{className:`cr`},[`Analytics`]),G(`p`,{className:`cs`},[`Track play, pause, seek, watch time`])]),G(`div`,{className:`cp`},[G(`div`,{className:`cq`},[`🔍`]),G(`h3`,{className:`cr`},[`Seek Preview`]),G(`p`,{className:`cs`},[`Hover to preview timestamp`])]),G(`div`,{className:`cp`},[G(`div`,{className:`cq`},[`📦`]),G(`h3`,{className:`cr`},[`Buffer Bar`]),G(`p`,{className:`cs`},[`Visual buffering indicator`])]),G(`div`,{className:`cp`},[G(`div`,{className:`cq`},[`🎬`]),G(`h3`,{className:`cr`},[`Mini Player`]),G(`p`,{className:`cs`},[`Floating player mode`])]),G(`div`,{className:`cp`},[G(`div`,{className:`cq`},[`🎯`]),G(`h3`,{className:`cr`},[`Precise Control`]),G(`p`,{className:`cs`},[`Frame-accurate seeking`])]),G(`div`,{className:`cp`},[G(`div`,{className:`cq`},[`🔢`]),G(`h3`,{className:`cr`},[`Jump to %`]),G(`p`,{className:`cs`},[`Press 0-9 for percentage`])])])])])},BK=({ng=o({data:[]}),nh=[50],ni=[100],nj=false,nk=0})=>{const nl=(nm)=>{return G(`div`,{"key":gi(nm.x) + `-` + gi(nm.y),style:K([`position: absolute; ` + `top: ` + gi(nm.y * 60) + `px; ` + `left: ` + gi(nm.x * 120) + `px; ` + `width: ` + gi(nm.col * 120 - 2) + `px; ` + `height: ` + gi(nm.row * 60 - 2) + `px; ` + `border: 1px solid #ddd; display: flex; align-items: center; justify-content: center; padding: 10px;`])},[nm.text])};return G(`div`,{style:K([`border: 1px solid #ddd; position: relative; height: 400px; width: 600px;`])},[(()=>{const _0=[];const _1=ng.data;let _i=-1;for(let nn of _1){_i++;_0.push(nl(nn))};return _0})()])},BL=()=>{const no=()=>{return o({data:[n({x:0,y:0,col:1,row:1,text:`A1`,className:``}),n({x:1,y:0,col:1,row:1,text:`B1`,className:``}),n({x:2,y:0,col:1,row:1,text:`C1`,className:``}),n({x:0,y:1,col:1,row:1,text:`A2`,className:``}),n({x:1,y:1,col:1,row:1,text:`B2`,className:``}),n({x:2,y:1,col:1,row:1,text:`C2`,className:``}),n({x:0,y:2,col:1,row:1,text:`A3`,className:``}),n({x:1,y:2,col:1,row:1,text:`B3`,className:``}),n({x:2,y:2,col:1,row:1,text:`C3`,className:``})]})},np=()=>{return o({data:[n({x:0,y:0,col:2,row:1,text:`Merged Header`,className:``}),n({x:2,y:0,col:1,row:2,text:`Tall Cell`,className:``}),n({x:0,y:1,col:1,row:1,text:`A2`,className:``}),n({x:1,y:1,col:1,row:1,text:`B2`,className:``}),n({x:0,y:2,col:3,row:1,text:`Wide Footer`,className:``})]})},nq=()=>{return o({data:[n({x:0,y:0,col:1,row:1,text:`Name`,className:`header-cell`}),n({x:1,y:0,col:1,row:1,text:`Age`,className:`header-cell`}),n({x:2,y:0,col:1,row:1,text:`City`,className:`header-cell`}),n({x:0,y:1,col:1,row:1,text:`Alice`,className:``}),n({x:1,y:1,col:1,row:1,text:`25`,className:``}),n({x:2,y:1,col:1,row:1,text:`NYC`,className:``}),n({x:0,y:2,col:1,row:1,text:`Bob`,className:``}),n({x:1,y:2,col:1,row:1,text:`30`,className:``}),n({x:2,y:2,col:1,row:1,text:`LA`,className:``}),n({x:0,y:3,col:1,row:1,text:`Carol`,className:``}),n({x:1,y:3,col:1,row:1,text:`28`,className:``}),n({x:2,y:3,col:1,row:1,text:`SF`,className:``})]})};return G(`div`,{className:`ie`},[G(`h1`,{className:`ig`},[`Matrix`,G(`span`,{className:`io`},[`Grid Layout`])]),G(`p`,{className:`ih`},[`Flexible grid layout component with support for merged cells and fixed headers. `,`Perfect for complex table layouts and dashboard grids.`]),G(`ul`,{className:`ip`},[G(`li`,{className:`iq`},[`Support for merged cells (colspan/rowspan)`]),G(`li`,{className:`iq`},[`Fixed first column or row`]),G(`li`,{className:`iq`},[`Flexible cell sizing`]),G(`li`,{className:`iq`},[`Conflict detection for overlapping cells`]),G(`li`,{className:`iq`},[`Responsive scrolling`])]),G(`div`,{className:`ii`},[G(`h2`,{className:`ij`},[`Basic Grid`]),G(`p`,{className:`ik`},[`A simple 3x3 matrix with equal cell sizes.`]),G(`div`,{className:`il`},[G(BK,{ng:no(),ni:[120,120,120],nh:[60,60,60]})]),G(`div`,{className:`im`},[`data: [\n` + `  { x: 0, y: 0, col: 1, row: 1, text: "A1" },\n` + `  { x: 1, y: 0, col: 1, row: 1, text: "B1" },\n` + `  // ...\n` + `]`])]),G(`div`,{className:`ii`},[G(`h2`,{className:`ij`},[`Merged Cells`]),G(`p`,{className:`ik`},[`Cells can span multiple columns (col) or rows (row).`]),G(`div`,{className:`il`},[G(BK,{ng:np(),ni:[120,120,120],nh:[60,60,60]})]),G(`div`,{className:`im`},[`{ x: 0, y: 0, col: 2, row: 1, text: "Merged" }\n` + `{ x: 2, y: 0, col: 1, row: 2, text: "Tall Cell" }\n` + `{ x: 0, y: 2, col: 3, row: 1, text: "Wide Footer" }`])]),G(`div`,{className:`ii`},[G(`h2`,{className:`ij`},[`Table Layout`]),G(`p`,{className:`ik`},[`Use Matrix for table-like data with fixed headers.`]),G(`div`,{className:`il`},[G(BK,{ng:nq(),ni:[150,100,150],nh:[50,45,45,45],nj:true,nk:200})]),G(`div`,{className:`im`},[`<Matrix\n` + `  data={tableData}\n` + `  fixFirstRow={true}\n` + `  maxHeight={200}\n` + `/>`])]),G(`div`,{className:`ii`},[G(`h2`,{className:`ij`},[`Properties`]),G(`div`,{className:`im`},[`data: MatrixData           - Grid data with cell definitions\n` + `cellWidth: Array(Number)   - Width for each column\n` + `cellHeight: Array(Number)  - Height for each row\n` + `fixFirstColumn: Bool       - Fix first column on scroll\n` + `fixFirstRow: Bool          - Fix first row on scroll\n` + `maxWidth: Number           - Max width with horizontal scroll\n` + `maxHeight: Number          - Max height with vertical scroll\n` + `width: Number              - Fixed matrix width\n` + `height: Number             - Fixed matrix height`])])])},BM=({nr=[],ns=``,nt=`line`,nu=`#1989fa`,nv=`#fff`,nw=300,nx=`40px`,ny=`3px`,nz=false,oa=false,ob=false,oc=false,od=false,oe=0,of=5,og=``,oh=`#646566`,oi=true,oj=false,ok=(ol)=>{return cl()},om=(on)=>{return cl()},oo=(op)=>{return cl()},oq=(or)=>{return cl()},os=(ot)=>{return true}})=>{const ou=F(``),ov=F(0),ow=F(``),ox=F(false),oy=F(0),oz=F(0),pa=F(0),pb=()=>{((() => {
      setTimeout(() => {
        const tabs = nr;
        const currentActive = ou.value;
        const lineWidth = nx;
        const lineHeight = ny;
        const shrink = oj;

        console.log('updateLinePosition: currentActive =', currentActive);

        const index = tabs.findIndex(tab => tab.name === currentActive);
        console.log('updateLinePosition: index =', index);
        if (index < 0) {
          console.log('updateLinePosition: index < 0, returning');
          return;
        }

        const navElement = document.querySelector('[role="tablist"]');
        console.log('updateLinePosition: navElement =', navElement);
        if (!navElement) {
          console.log('updateLinePosition: no navElement found');
          return;
        }

        const tabElements = navElement.querySelectorAll('[role="tab"]');
        console.log('updateLinePosition: tabElements =', tabElements);
        if (index >= tabElements.length) {
          console.log('updateLinePosition: index >= tabElements.length');
          return;
        }

        const currentTab = tabElements[index];
        if (!currentTab) {
          console.log('updateLinePosition: no currentTab');
          return;
        }

        const tabRect = currentTab.getBoundingClientRect();
        const navRect = navElement.getBoundingClientRect();

        // Calculate position relative to nav container
        const left = tabRect.left - navRect.left + navElement.scrollLeft;

        // Calculate the line width
        const lineWidthPx = parseInt(lineWidth) || 40;

        // Center the line under the tab
        const tabCenter = left + (tabRect.width / 2);
        const lineLeft = tabCenter - (lineWidthPx / 2);

        const newStyle = "transform: translateX(" + lineLeft + "px); width: " + lineWidth + "; height: " + lineHeight + ";";
        console.log('updateLinePosition: newStyle =', newStyle);
        (()=>{ow.value=(newStyle)})()

        // Auto-scroll to center active tab in shrink mode
        if (shrink) {
          const scrollLeft = navElement.scrollLeft;
          const tabCenter = tabRect.left - navRect.left + scrollLeft + (tabRect.width / 2);
          const navCenter = navRect.width / 2;
          const targetScroll = tabCenter - navCenter;

          navElement.scrollTo({
            left: targetScroll,
            behavior: 'smooth'
          });
        }
      }, 50);
    })());return cl()},pc=()=>{((() => {
      const sticky = ob;
      if (!sticky) return;

      const offsetTop = oe;

      const handleScroll = () => {
        const scrollTop = window.pageYOffset || document.documentElement.scrollTop;
        const shouldBeFixed = scrollTop >= offsetTop;

        if (ox.value !== shouldBeFixed) {
          (()=>{ox.value=(shouldBeFixed)})()
          oo(m({scrollTop:(scrollTop),isFixed:(shouldBeFixed)}))
        }
      };

      window.addEventListener('scroll', handleScroll, { passive: true });
    })());return cl()},pd=(pe,pf,pg)=>{return (pe.disabled?oq(l({name:pe.name,title:pe.title,index:pf,disabled:pe.disabled})):(()=>{om(l({name:pe.name,title:pe.title,index:pf,disabled:pe.disabled}));(()=>{ou.value=pe.name})();pb();return ok(k({name:pe.name,title:pe.title,index:pf}))})())},ph=(pi)=>{((() => {
      const swipeable = oc;
      if (!swipeable) return;

      const touch = pi.touches[0];
      if (touch) {
        D(()=>{oy.value=(touch.clientX);oz.value=(touch.clientY)})
      }
    })());return cl()},pj=(pk)=>{((() => {
      const swipeable = oc;
      if (!swipeable) return;

      const touch = pk.touches[0];
      if (!touch) return;

      const deltaX = touch.clientX - oy.value;
      const deltaY = touch.clientY - oz.value;

      // If swiping vertically, don't interfere
      if (Math.abs(deltaY) > Math.abs(deltaX)) return;

      // Prevent default scroll when swiping horizontally
      pk.preventDefault();
    })());return cl()},pl=(pm)=>{((() => {
      const swipeable = oc;
      if (!swipeable) return;

      const touch = pm.changedTouches[0];
      if (!touch) return;

      const deltaX = touch.clientX - oy.value;
      const deltaY = touch.clientY - oz.value;

      // Only process horizontal swipes
      if (Math.abs(deltaY) > Math.abs(deltaX)) return;

      const threshold = of || 5;
      const tabs = nr;
      const currentIndex = tabs.findIndex(tab => tab.name === ou.value);

      if (Math.abs(deltaX) > threshold) {
        if (deltaX > 0 && currentIndex > 0) {
          // Swipe right - go to previous tab
          const prevTab = tabs[currentIndex - 1];
          if (!prevTab.disabled) {
            pd((prevTab),(currentIndex - 1),pm)
          }
        } else if (deltaX < 0 && currentIndex < tabs.length - 1) {
          // Swipe left - go to next tab
          const nextTab = tabs[currentIndex + 1];
          if (!nextTab.disabled) {
            pd((nextTab),(currentIndex + 1),pm)
          }
        }
      }
    })());return cl()},pn=()=>{const _={[`--x-a`]:nv};return _},po=()=>{const _={};(E(nt,`card`)?Object.assign(_,{[`--ab-a`]:`0 16px`,[`--ab-b`]:`2px`,[`--ab-c`]:`var(--mint-background, #f7f8fa)`}):null);(oj?Object.assign(_,{[`--ab-d`]:`nowrap`}):Object.assign(_,{[`--ab-e`]:`1`}));return _},pp=()=>{const _={};(!oj?Object.assign(_,{[`--ac-a`]:`1`}):null);return _},pq=(pr,ps)=>{const _={[`--y-a`]:`all ` + gi(nw) + `ms`};(pr?Object.assign(_,{[`--y-b`]:(bo(og)?nu:og),[`--y-c`]:`500`}):Object.assign(_,{[`--y-b`]:oh,[`--y-c`]:`400`}));(ps?Object.assign(_,{[`--y-b`]:`var(--mint-text-color-3, #c8c9cc)`,[`--y-d`]:`not-allowed`}):null);(oj?Object.assign(_,{[`--y-e`]:`0 0 auto`,[`--y-f`]:`0 12px`}):null);(oi?Object.assign(_,{[`--y-g`]:`nowrap`,[`--y-h`]:`hidden`,[`--y-i`]:`ellipsis`}):null);(pr?Object.assign(_,{[`--ad-a`]:`#fff`,[`--ad-b`]:`2px`}):null);return _},pt=()=>{const _={[`--z-a`]:nu,[`--z-b`]:`all ` + gi(nw) + `ms`};return _},pu=()=>{const _={};(nz?Object.assign(_,{[`--ae-a`]:`hidden`}):null);return _},pv=()=>{const _={[`--aa-a`]:`transform ` + gi(nw) + `ms`,[`--aa-b`]:`translateX(` + gi(pa.value) + `%)`};return _};H(()=>{(()=>{((() => {
      (()=>{ou.value=ns})()
      pc()
      pb()
    })());return cl()})()},[]);I(()=>{((() => {
      if (ou.value !== ns) {
        console.log('Tabs: Updating from', ou.value, 'to', ns);
        (()=>{ou.value=ns})()
        setTimeout(() => {
          console.log('Tabs: Calling updateLinePosition');
          pb()
        }, 150);
      }
    })());return cl()});return G(`div`,{},[G(`div`,{className:(ob && ox.value?`containerSticky`:``) + ` jh`,style:K([pn()])},[G(`div`,{className:`ji`,style:K([po()])},[G(`div`,{"role":`tablist`,"onTouchStart":ph,"onTouchMove":pj,"onTouchEnd":pl,className:`jj`,style:K([pp()])},[(()=>{const _0=[];const _1=nr;let _i=-1;for(let pw of _1){_i++;const px=_i;_0.push(G(`div`,{"key":pw.name,"role":`tab`,"onClick":(py)=>{return pd(pw,px,py)},className:`jk`,style:K([pq(E(pw.name,ou.value),pw.disabled),pw.titleStyle])},[G(`span`,{className:`jl`},[(!bo(pw.icon)?G(`span`,{className:`jm`},[pw.icon]):null),pw.title,(pw.dot?G(`span`,{className:`jn`}):null),(!bo(pw.badge)?G(`span`,{className:`jo`},[pw.badge]):null)])]))};return _0})(),(E(nt,`line`)?G(`div`,{className:`jp`,style:K([pt(),ow.value])}):null)])])]),(nz?G(`div`,{className:`jq`,style:K([pu()])},[G(`div`,{className:`jr`,style:K([pv()])},[(()=>{const _0=[];const _1=nr;let _i=-1;for(let pz of _1){_i++;const qa=_i;_0.push(G(`div`,{"key":pz.name,className:`js`},[(!bo(pz.content)?G(`div`,{},[pz.content]):null)]))};return _0})()])]):null)])},BN=()=>{const qb=F(`tab1`),qc=F(`a`),qd=F(`card1`),qe=F(`badge1`),qf=()=>{return [j({name:`tab1`,title:`Tab 1`,disabled:false,dot:false,badge:``,titleStyle:``,icon:``,content:``}),j({name:`tab2`,title:`Tab 2`,disabled:false,dot:false,badge:``,titleStyle:``,icon:``,content:``}),j({name:`tab3`,title:`Tab 3`,disabled:false,dot:false,badge:``,titleStyle:``,icon:``,content:``}),j({name:`tab4`,title:`Tab 4`,disabled:false,dot:false,badge:``,titleStyle:``,icon:``,content:``})]},qg=()=>{return [j({name:`a`,title:`Tab A`,disabled:false,dot:false,badge:``,titleStyle:``,icon:``,content:``}),j({name:`b`,title:`Tab B`,disabled:false,dot:false,badge:``,titleStyle:``,icon:``,content:``}),j({name:`c`,title:`Tab C`,disabled:false,dot:false,badge:``,titleStyle:``,icon:``,content:``})]},qh=()=>{return [j({name:`badge1`,title:`Tab`,disabled:false,dot:true,badge:``,titleStyle:``,icon:``,content:``}),j({name:`badge2`,title:`Tab`,disabled:false,dot:false,badge:`5`,titleStyle:``,icon:``,content:``}),j({name:`badge3`,title:`Tab`,disabled:false,dot:false,badge:`99+`,titleStyle:``,icon:``,content:``})]},qi=(qj)=>{return (()=>{qb.value=qj.name})()},qk=(ql)=>{return (()=>{qc.value=ql.name})()},qm=(qn)=>{return (()=>{qd.value=qn.name})()},qo=(qp)=>{return (()=>{qe.value=qp.name})()},qq=()=>{return G(`div`,{className:`fh`},[G(`h1`,{className:`fl`,style:K([qr()])},[`Tabs`,G(`span`,{className:`fn`},[`Navigation`])]),G(`p`,{className:`fm`,style:K([qs()])},[`Used to switch between different content areas.`]),G(`div`,{className:`fi`,style:K([qt()])},[G(`div`,{className:`fj`},[`Basic Usage`]),G(BM,{nr:qf(),ns:qb.value,ok:qi}),G(`div`,{className:`fk`},[(E(qb.value,`tab1`)?`Content of Tab 1`:(E(qb.value,`tab2`)?`Content of Tab 2`:(E(qb.value,`tab3`)?`Content of Tab 3`:`Content of Tab 4`)))])]),G(`div`,{className:`fi`,style:K([qt()])},[G(`div`,{className:`fj`},[`Match by name`]),G(BM,{nr:qg(),ns:qc.value,ok:qk}),G(`div`,{className:`fk`},[(E(qc.value,`a`)?`Content of Tab A`:(E(qc.value,`b`)?`Content of Tab B`:`Content of Tab C`))])]),G(`div`,{className:`fi`,style:K([qt()])},[G(`div`,{className:`fj`},[`Card Style`]),G(BM,{nr:qf(),ns:qd.value,nt:`card`,ok:qm}),G(`div`,{className:`fk`},[(E(qd.value,`tab1`)?`Card Style Tab 1`:(E(qd.value,`tab2`)?`Card Style Tab 2`:(E(qd.value,`tab3`)?`Card Style Tab 3`:`Card Style Tab 4`)))])]),G(`div`,{className:`fi`,style:K([qt()])},[G(`div`,{className:`fj`},[`Badge & Dot`]),G(BM,{nr:qh(),ns:qe.value,ok:qo}),G(`div`,{className:`fk`},[(E(qe.value,`badge1`)?`Tab with dot indicator`:(E(qe.value,`badge2`)?`Tab with badge count (5)`:`Tab with 99+ badge`))])])])},qu=()=>{const _={};(E(ah.value,`mobile`)?Object.assign(_,{[`--c-a`]:`0`}):null);return _},qt=()=>{const _={};(E(ah.value,`mobile`)?Object.assign(_,{[`--d-a`]:`16px`,[`--d-b`]:`0`}):null);return _},qr=()=>{const _={};(E(ah.value,`mobile`)?Object.assign(_,{[`--e-a`]:`24px`,[`--e-b`]:`0 0 16px`,[`--e-c`]:`16px`}):null);return _},qs=()=>{const _={};(E(ah.value,`mobile`)?Object.assign(_,{[`--f-a`]:`14px`,[`--f-b`]:`22px`}):null);return _};return G(`div`,{className:`fa`,style:K([qu()])},[(E(ah.value,`mobile`)?G(`div`,{className:`fb`},[G(`div`,{className:`fd`},[G(`div`,{className:`fe`})]),G(`div`,{className:`ff`},[qq()])]):G(`div`,{className:`fb fc`},[G(`div`,{className:`ff fg`},[qq()])]))])},BO=({qv=h({name:``,tel:``,province:``,city:``,county:``,addressDetail:``,areaCode:``,isDefault:false}),qw=[],qx=false,qy=false,qz=false,ra=true,rb=true,rc=false,rd=`Save`,re=`Delete`,rf=1,rg=200,rh=20,ri=false,rj=false,rk=`Area`,rl=`Name`,rm=`Phone`,rn=`Detailed Address`,ro=(rp)=>{return u(null)},rq=(rr)=>{return u(null)},rs=(rt,ru)=>{return u(null)},rv=(rw)=>{return u(null)},rx=(ry)=>{return u(null)},rz=(sa)=>{return u(null)},sb=(sc)=>{return u(null)},sd=()=>{return u(null)},se=(sf)=>{return true},sg=(sh,si)=>{return ``},sj=null,sk=[`Choose`,`Choose`,`Choose`]})=>{const sl=F(``),sm=F(``),sn=F(``),so=F(``),sp=F(``),sq=F(``),sr=F(``),ss=F(false),st=F(false),su=F(``),sv=F(``),sw=F(``),sx=F(``),sy=(sz)=>{D(()=>{sl.value=sz;su.value=``});return rs(`name`,sz)},ta=(tb)=>{D(()=>{sm.value=tb;sv.value=``});return rs(`tel`,tb)},tc=(td)=>{D(()=>{sq.value=td;sx.value=``});return rv(td)},te=(tf)=>{return sb(`name`)},tg=(th)=>{return sb(`tel`)},ti=(tj)=>{return sb(`addressDetail`)},tk=(tl)=>{((() => {
      const value = event.target.value || "";
      sy((value))
    })());return u(null)},tm=(tn)=>{((() => {
      const value = event.target.value || "";
      ta((value))
    })());return u(null)},to=(tp)=>{((() => {
      const value = event.target.value || "";
      tc((value))
    })());return u(null)},tq=(tr)=>{((() => {
      const newValue = !ss.value;
      ts((newValue))
    })());return u(null)},ts=(tt)=>{(()=>{ss.value=tt})();return rx(tt)},tu=(tv)=>{return (!rc?(()=>{(()=>{st.value=true})();return sd()})():u(null))},tw=()=>{return (()=>{su.value=`Please fill in the name`})()},tx=(ty)=>{return (()=>{su.value=ty})()},tz=(ua)=>{return (()=>{sv.value=ua})()},ub=()=>{return (()=>{sw.value=`Please select area`})()},uc=()=>{return (()=>{sx.value=`Please fill in the address`})()},ud=()=>{return D(()=>{su.value=``;sv.value=``;sw.value=``;sx.value=``})},ue=()=>{return h({name:sl.value,tel:sm.value,province:sn.value,city:so.value,county:sp.value,addressDetail:sq.value,areaCode:sr.value,isDefault:ss.value})},uf=()=>{((() => {
      const nameValidationError = sg(`name`,sl.value);
      const telValidationError = sg(`tel`,sm.value);
      const telValid = se(sm.value);

      if (bo(sl.value)) {
        tw()
      } else if (nameValidationError) {
        tx((nameValidationError))
      } else if (bo(sm.value)) {
        tz(`Please fill in the phone`)
      } else if (!telValid) {
        tz(`Invalid phone number`)
      } else if (telValidationError) {
        tz((telValidationError))
      } else if (ra && bo(sr.value)) {
        ub()
      } else if (rb && bo(sq.value)) {
        uc()
      } else {
        ro(ue())
      }
    })());return u(null)},ug=(uh)=>{(event.preventDefault());ud();return uf()},ui=(uj)=>{(event.preventDefault());return rq(ue())},uk=(ul)=>{(()=>{sq.value=ul.address})();return rz(ul)},um=()=>{return (bq(sn.value) && bq(so.value) && bq(sp.value)?sn.value + ` ` + so.value + ` ` + sp.value:(bq(sr.value)?`Selected`:``))};H(()=>{(()=>{return D(()=>{sl.value=qv.name;sm.value=qv.tel;sn.value=qv.province;so.value=qv.city;sp.value=qv.county;sq.value=qv.addressDetail;sr.value=qv.areaCode;ss.value=qv.isDefault})})()},[]);return G(`div`,{className:`cz`},[G(`form`,{"onSubmit":ug,className:`da`},[G(`div`,{className:`db`},[G(`div`,{className:`dc`},[G(`div`,{className:`dd`},[`Name`]),G(`div`,{className:`de`},[G(`input`,{"type":`text`,"value":sl.value,"placeholder":rl,"onFocus":te,"onChange":tk,className:`df`})])]),(bq(su.value)?G(`div`,{className:`dj`},[su.value]):null),G(`div`,{className:`dc`},[G(`div`,{className:`dd`},[`Phone`]),G(`div`,{className:`de`},[G(`input`,{"type":`tel`,"value":sm.value,"placeholder":rm,"maxlength":gi(rh),"onFocus":tg,"onChange":tm,className:`df`})])]),(bq(sv.value)?G(`div`,{className:`dj`},[sv.value]):null),(ra?(()=>{G(`div`,{"onClick":tu,className:`dc`},[G(`div`,{className:`dd`},[`Area`]),G(`div`,{className:`de`},[G(`input`,{"type":`text`,"value":um(),"placeholder":rk,readOnly:true,"disabled":rc,className:`df`}),G(`span`,{className:`dk`},[`›`])])]);return (bq(sw.value)?G(`div`,{className:`dj`},[sw.value]):null)})():null)]),(rb?(()=>{G(`div`,{className:`dg`},[G(`div`,{className:`dh`},[`Detailed Address`]),G(`textarea`,{"value":sq.value,"placeholder":rn,"rows":gi(rf),"maxlength":gi(rg),"onFocus":ti,"onChange":to,className:`di`})]);return (bq(sx.value)?G(`div`,{className:`dj`},[sx.value]):null)})():null),sj,(qz && fw(qw) > 0?G(`div`,{className:`du`},[(()=>{const _0=[];const _1=qw;let _i=-1;for(let un of _1){_i++;_0.push(G(`div`,{"onClick":(uo)=>{return uk(un)},className:`dv`},[G(`div`,{className:`dw`},[un.name]),G(`div`,{className:`dx`},[un.address])]))};return _0})()]):null),(qy?G(`div`,{className:`dl`},[G(`span`,{className:`dm`},[`Set as the default address`]),G(`div`,{"onClick":tq,className:(ss.value?`switchOn`:``) + ` dn`},[G(`div`,{className:(ss.value?`switchNodeOn`:``) + ` dp`})])]):null),G(`div`,{className:`dq`},[G(`button`,{"type":`submit`,"disabled":ri,className:`dr ds`},[(ri?G(`div`,{className:`dy`}):null),G(`span`,{},[rd])]),(qx?G(`button`,{"type":`button`,"disabled":rj,"onClick":ui,className:`dr dt`},[(rj?G(`div`,{className:`dy dz`}):null),G(`span`,{},[re])]):null)])])])},BP=()=>{const up=F([]),uq=F(h({name:`John Doe`,tel:`+1 234-567-8900`,province:`California`,city:`Los Angeles`,county:`Los Angeles County`,addressDetail:`123 Main Street, Apt 4B, Building A`,areaCode:`90001`,isDefault:true})),ur=F(h({name:``,tel:``,province:``,city:``,county:``,addressDetail:``,areaCode:``,isDefault:false})),us=F(false),ut=F(``),uu=F(`filled`),uv=()=>{return (()=>{us.value=false})()},uw=(ux)=>{return D(()=>{us.value=true;ut.value=ux})},uy=(uz)=>{((() => {
      uw(uz)

      setTimeout(() => {
        uv()
      }, 2000);
    })());return u(null)},va=(vb)=>{return uy(`Address saved!`)},vc=(vd)=>{return uy(`Address deleted!`)},ve=(vf,vg)=>{return u(null)},vh=(vi)=>{return (bq(vi)?(()=>{up.value=[i({name:`Home`,address:`123 Main Street, Apt 4B`}),i({name:`Work`,address:`456 Business Ave, Suite 100`})]})():(()=>{up.value=[]})())},vj=(vk)=>{return u(null)},vl=(vm)=>{(()=>{up.value=[]})();return uy(`Selected: ` + vm.name)},vn=(vo)=>{return (()=>{uu.value=`filled`})()},vp=(vq)=>{return (()=>{uu.value=`empty`})()},vr=()=>{return (E(uu.value,`filled`)?uq.value:ur.value)};return G(`div`,{className:`ea`},[G(`div`,{className:`eb`},[G(`h1`,{className:`ec`},[`📍 AddressEdit`]),G(`p`,{className:`ed`},[`Create, update, and delete receiving addresses with validation and search functionality`])]),G(`div`,{className:`ee`},[G(`div`,{className:`ef`},[G(`h2`,{className:`eg`},[`📱 Basic Usage`,G(`span`,{className:`eh`},[`Mobile`])]),G(`div`,{className:`ey`},[G(`button`,{"onClick":vn,className:(E(uu.value,`filled`)?`tabButtonActive`:``) + ` ez`},[`With Data`]),G(`button`,{"onClick":vp,className:(E(uu.value,`empty`)?`tabButtonActive`:``) + ` ez`},[`Empty Form`])]),G(`div`,{className:`ei`},[(E(ah.value,`mobile`)?G(`div`,{className:`ej`},[G(`div`,{className:`el`},[G(`div`,{className:`em`})]),G(`div`,{className:`en`},[G(BO,{qv:vr(),qw:up.value,qx:true,qy:true,qz:fw(up.value) > 0,ra:true,rb:true,rl:`Name`,rm:`Phone`,rk:`Area`,rn:`Address`,rd:`Save Address`,re:`Delete Address`,ro:va,rq:vc,rs:ve,rv:vh,rx:vj,rz:vl})])]):G(`div`,{className:`ej ek`},[G(`div`,{className:`en eo`},[G(BO,{qv:vr(),qw:up.value,qx:true,qy:true,qz:fw(up.value) > 0,ra:true,rb:true,rl:`Name`,rm:`Phone`,rk:`Area`,rn:`Address`,rd:`Save Address`,re:`Delete Address`,ro:va,rq:vc,rs:ve,rv:vh,rx:vj,rz:vl})])]))]),G(`div`,{className:`ex`},[(E(ah.value,`mobile`)?`💡 Mobile view: Switch between 'With Data' and 'Empty Form' to see different states. Try typing in the 'Address' field to see search suggestions. Use the navbar toggle to switch to Desktop view.`:`💡 Desktop view: This shows how the component looks on larger screens. Switch to Mobile view using the navbar toggle to see the mobile-optimized design.`)]),G(`div`,{className:`ep`},[`<AddressEdit\n`,`  addressInfo={addressInfo}\n`,`  searchResult={searchResult}\n`,`  showDelete={true}\n`,`  showSetDefault={true}\n`,`  showSearchResult={true}\n`,`  onSave={handleSave}\n`,`  onDelete={handleDelete}\n`,`  onChangeDetail={handleChangeDetail}/>`])]),G(`div`,{className:`ef`},[G(`h2`,{className:`eg`},[`📋 Props`]),G(`table`,{className:`eq`},[G(`thead`,{className:`er`},[G(`tr`,{},[G(`th`,{className:`es`},[`Attribute`]),G(`th`,{className:`es`},[`Description`]),G(`th`,{className:`es`},[`Type`]),G(`th`,{className:`es`},[`Default`])])]),G(`tbody`,{},[G(`tr`,{className:`et`},[G(`td`,{className:`ev`},[`addressInfo`]),G(`td`,{className:`eu`},[`Address information object`]),G(`td`,{className:`ev`},[`AddressEditInfo`]),G(`td`,{className:`ev`},[`{}`])]),G(`tr`,{className:`et`},[G(`td`,{className:`ev`},[`searchResult`]),G(`td`,{className:`eu`},[`Address search results`]),G(`td`,{className:`ev`},[`Array(AddressEditSearchItem)`]),G(`td`,{className:`ev`},[`[]`])]),G(`tr`,{className:`et`},[G(`td`,{className:`ev`},[`showDelete`]),G(`td`,{className:`eu`},[`Whether to show delete button`]),G(`td`,{className:`ev`},[`Bool`]),G(`td`,{className:`ev`},[`false`])]),G(`tr`,{className:`et`},[G(`td`,{className:`ev`},[`showSetDefault`]),G(`td`,{className:`eu`},[`Whether to show default address switch`]),G(`td`,{className:`ev`},[`Bool`]),G(`td`,{className:`ev`},[`false`])]),G(`tr`,{className:`et`},[G(`td`,{className:`ev`},[`showSearchResult`]),G(`td`,{className:`eu`},[`Whether to show search results`]),G(`td`,{className:`ev`},[`Bool`]),G(`td`,{className:`ev`},[`false`])]),G(`tr`,{className:`et`},[G(`td`,{className:`ev`},[`showArea`]),G(`td`,{className:`eu`},[`Whether to show area field`]),G(`td`,{className:`ev`},[`Bool`]),G(`td`,{className:`ev`},[`true`])]),G(`tr`,{className:`et`},[G(`td`,{className:`ev`},[`showDetail`]),G(`td`,{className:`eu`},[`Whether to show detail field`]),G(`td`,{className:`ev`},[`Bool`]),G(`td`,{className:`ev`},[`true`])]),G(`tr`,{className:`et`},[G(`td`,{className:`ev`},[`disableArea`]),G(`td`,{className:`eu`},[`Whether to disable area select`]),G(`td`,{className:`ev`},[`Bool`]),G(`td`,{className:`ev`},[`false`])]),G(`tr`,{className:`et`},[G(`td`,{className:`ev`},[`isSaving`]),G(`td`,{className:`eu`},[`Show save button loading status`]),G(`td`,{className:`ev`},[`Bool`]),G(`td`,{className:`ev`},[`false`])]),G(`tr`,{className:`et`},[G(`td`,{className:`ev`},[`isDeleting`]),G(`td`,{className:`eu`},[`Show delete button loading status`]),G(`td`,{className:`ev`},[`Bool`]),G(`td`,{className:`ev`},[`false`])])])])]),G(`div`,{className:`ef`},[G(`h2`,{className:`eg`},[`⚡ Events`]),G(`table`,{className:`eq`},[G(`thead`,{className:`er`},[G(`tr`,{},[G(`th`,{className:`es`},[`Event`]),G(`th`,{className:`es`},[`Description`]),G(`th`,{className:`es`},[`Arguments`])])]),G(`tbody`,{},[G(`tr`,{className:`et`},[G(`td`,{className:`ev`},[`onSave`]),G(`td`,{className:`eu`},[`Emitted when save button is clicked`]),G(`td`,{className:`ev`},[`info: AddressEditInfo`])]),G(`tr`,{className:`et`},[G(`td`,{className:`ev`},[`onDelete`]),G(`td`,{className:`eu`},[`Emitted when delete is confirmed`]),G(`td`,{className:`ev`},[`info: AddressEditInfo`])]),G(`tr`,{className:`et`},[G(`td`,{className:`ev`},[`onChange`]),G(`td`,{className:`eu`},[`Emitted when name or tel field changes`]),G(`td`,{className:`ev`},[`key: String, value: String`])]),G(`tr`,{className:`et`},[G(`td`,{className:`ev`},[`onChangeDetail`]),G(`td`,{className:`eu`},[`Emitted when address detail changes`]),G(`td`,{className:`ev`},[`value: String`])]),G(`tr`,{className:`et`},[G(`td`,{className:`ev`},[`onChangeDefault`]),G(`td`,{className:`eu`},[`Emitted when switching default address`]),G(`td`,{className:`ev`},[`checked: Bool`])]),G(`tr`,{className:`et`},[G(`td`,{className:`ev`},[`onSelectSearch`]),G(`td`,{className:`eu`},[`Emitted when search result is selected`]),G(`td`,{className:`ev`},[`item: AddressEditSearchItem`])])])])]),G(`div`,{className:`ef`},[G(`h2`,{className:`eg`},[`📦 Types`]),G(`div`,{className:`ep`},[`type AddressEditInfo {\n`,`  name: String,\n`,`  tel: String,\n`,`  province: String,\n`,`  city: String,\n`,`  county: String,\n`,`  addressDetail: String,\n`,`  areaCode: String,\n`,`  isDefault: Bool\n`,`}\n\n`,`type AddressEditSearchItem {\n`,`  name: String,\n`,`  address: String\n`,`}`])]),G(`div`,{className:`ef`},[G(`h2`,{className:`eg`},[`🎨 CSS Variables`]),G(`table`,{className:`eq`},[G(`thead`,{className:`er`},[G(`tr`,{},[G(`th`,{className:`es`},[`Name`]),G(`th`,{className:`es`},[`Default Value`]),G(`th`,{className:`es`},[`Description`])])]),G(`tbody`,{},[G(`tr`,{className:`et`},[G(`td`,{className:`ev`},[`--mint-address-edit-padding`]),G(`td`,{className:`ev`},[`var(--mint-padding-sm, 12px)`]),G(`td`,{className:`eu`},[`Form fields padding`])]),G(`tr`,{className:`et`},[G(`td`,{className:`ev`},[`--mint-address-edit-buttons-padding`]),G(`td`,{className:`ev`},[`16px 16px`]),G(`td`,{className:`eu`},[`Buttons container padding`])]),G(`tr`,{className:`et`},[G(`td`,{className:`ev`},[`--mint-address-edit-button-margin-bottom`]),G(`td`,{className:`ev`},[`12px`]),G(`td`,{className:`eu`},[`Button margin bottom`])]),G(`tr`,{className:`et`},[G(`td`,{className:`ev`},[`--mint-address-edit-button-font-size`]),G(`td`,{className:`ev`},[`var(--mint-font-size-lg, 16px)`]),G(`td`,{className:`eu`},[`Button font size`])]),G(`tr`,{className:`et`},[G(`td`,{className:`ev`},[`--mint-primary-color`]),G(`td`,{className:`ev`},[`#1989fa`]),G(`td`,{className:`eu`},[`Primary color for buttons and switch`])]),G(`tr`,{className:`et`},[G(`td`,{className:`ev`},[`--mint-danger-color`]),G(`td`,{className:`ev`},[`#ee0a24`]),G(`td`,{className:`eu`},[`Danger color for delete and errors`])]),G(`tr`,{className:`et`},[G(`td`,{className:`ev`},[`--mint-background`]),G(`td`,{className:`ev`},[`#f7f8fa`]),G(`td`,{className:`eu`},[`Background color`])]),G(`tr`,{className:`et`},[G(`td`,{className:`ev`},[`--mint-border-color`]),G(`td`,{className:`ev`},[`#ebedf0`]),G(`td`,{className:`eu`},[`Border color`])]),G(`tr`,{className:`et`},[G(`td`,{className:`ev`},[`--mint-text-color`]),G(`td`,{className:`ev`},[`#323233`]),G(`td`,{className:`eu`},[`Primary text color`])]),G(`tr`,{className:`et`},[G(`td`,{className:`ev`},[`--mint-text-color-2`]),G(`td`,{className:`ev`},[`#969799`]),G(`td`,{className:`eu`},[`Secondary text color`])]),G(`tr`,{className:`et`},[G(`td`,{className:`ev`},[`--mint-text-color-3`]),G(`td`,{className:`ev`},[`#c8c9cc`]),G(`td`,{className:`eu`},[`Placeholder text color`])])])])])]),(us.value?G(`div`,{className:`ew`},[ut.value]):null)])},vs=()=>{return null},vt=(vu,vv)=>{return (vu.filter(vv))},vw=(vx,vy)=>{return ((() => {
      for (let item of vx) {
        if (E(vy, item)) {
          return true
        }
      }

      return false
    })())},vz=(wa,wb)=>{return (wa.split(wb))},wc=(wd)=>{return (wd.length)},we=(wf,wg)=>{return (Math.min(wf, wg))},wh=(wi,wj)=>{return (Math.max(wi, wj))},wk=(wl,wm,wn)=>{return we(wn,wh(wm,wl))},wo=(wp,wq)=>{return (wp.slice(wk(0,wq,wc(wp))))},wr=(ws,wt)=>{return (ws.startsWith(wt))},wu=(wv,ww,wx)=>{return (wx >= wc(wv)?P(S)(wv):(()=>{const wy=(wv.substring(wx, wx + 1));return (E(wy,ww)?P(S)((wv.substring(0, wx + 1))):wu(wv,ww,wx + 1))})())},wz=(xa)=>{return (wr(xa,`"`)?wu(xa,`"`,1):(wr(xa,`'`)?wu(xa,`'`,1):new T()))},xb=(xc,xd,xe)=>{return (xc.replace(xd, xe))},xf=(xg)=>{return xb(xb(xb(xg,`&`,`&amp;`),`<`,`&lt;`),`>`,`&gt;`)},xh=(xi,xj)=>{return `<span style='color: ` + xj + `;'>` + xf(xi) + `</span>`},xk=(xl)=>{return (bo(xl)?false:((() => { const c = xl.charCodeAt(0); return (c >= 48 && c <= 57) || (c >= 65 && c <= 90) || (c >= 97 && c <= 122) || c === 95; })()))},xm=(xn,xo)=>{return (xo >= wc(xn)?P(S)((xn.substring(0, xo))):(()=>{const xp=(xn.substring(xo, xo + 1));return (xk(xp)?xm(xn,xo + 1):P(S)((xn.substring(0, xo))))})())},xq=(xr)=>{const xs=(xr.substring(0, 1));return (xk(xs)?xm(xr,1):new T())},xt=(xu,xv)=>{return Q((()=>{const _0=[];const _1=xu;let _i=-1;for(let xw of _1){_i++;const _2=xv(xw);if(!_2){continue};_0.push(xw)};return _0})(),0,S,T)},xx=(xy,xz)=>{return !E(xt(xy,xz),new T())},ya=(yb,yc)=>{return xx(yb,(yd)=>{return E(yd,yc)})},ye=(yf,yg,yh,yi,yj)=>{return (yi >= wc(yf)?yj:(()=>{const yk=wo(yf,yi);return M(wz(yk),[[N(S,[O]),(yl)=>{return (()=>{const ym=wc(yl);const yn=xh(yl,`#CE9178`);return ye(yf,yg,yh,yi + ym,yj + yn)})()}],[N(T,[]),()=>{return M(xq(yk),[[N(S,[O]),(yo)=>{return (()=>{const yp=wc(yo);const yq=(ya(yg,yo)?xh(yo,`#C586C0`):(ya(yh,yo)?xh(yo,`#4EC9B0`):xh(yo,`#9CDCFE`)));return ye(yf,yg,yh,yi + yp,yj + yq)})()}],[N(T,[]),()=>{return (()=>{const yr=(yk.substring(0, 1));const ys=xh(yr,`#D4D4D4`);return ye(yf,yg,yh,yi + 1,yj + ys)})()}]])}]])})())},yt=(yu,yv,yw)=>{return ye(yu,yv,yw,0,``)},yx=(yy,yz,za,zb,zc)=>{return (zb >= fw(yy)?zc:M(gf(yy,zb),[[N(S,[O]),(zd)=>{return (()=>{const ze=yt(zd,yz,za);const zf=(zb < fw(yy) - 1?ze + `\n`:ze);return yx(yy,yz,za,zb + 1,zc + zf)})()}],[N(T,[]),()=>{return yx(yy,yz,za,zb + 1,zc)}]]))},zg=(zh,zi,zj)=>{const zk=vz(zh,`\n`);return yx(zk,zi,zj,0,``)},zl=(zm)=>{return zg(zm,[`module`,`component`,`fun`,`property`,`state`,`const`,`if`,`else`,`case`,`for`,`of`,`do`,`next`,`let`,`try`,`catch`,`where`,`return`,`await`,`encode`,`decode`,`style`,`connect`,`exposing`,`use`,`provider`,`subscription`,`sequence`],[`String`,`Number`,`Bool`,`Array`,`Maybe`,`Result`,`Promise`,`Html`,`Void`,`Time`,`Tuple`])},zn=(zo)=>{return zg(zo,[`import`,`from`,`to`,`important`,`media`,`keyframes`,`and`,`not`,`only`],[`color`,`background`,`background-color`,`border`,`border-radius`,`margin`,`padding`,`width`,`height`,`display`,`position`,`top`,`right`,`bottom`,`left`,`flex`,`grid`,`font`,`font-size`,`font-weight`,`opacity`,`transform`,`transition`,`animation`,`animation-name`,`animation-duration`,`animation-timing-function`,`animation-delay`,`animation-fill-mode`])},BQ=({zp=``,zq=`mint`,zr=false})=>{const zs=()=>{return (navigator.clipboard.writeText(zp))},zt=()=>{return (E(zq,`mint`)?zl(zp):(E(zq,`css`)?zn(zp):xf(zp)))};return G(`div`,{className:`jf`},[(zr?G(`button`,{"onClick":(zu)=>{return zs()},className:`jg`},[`📋 Copy`]):null),G(`div`,{"dangerouslySetInnerHTML":({__html: zt()})})])},zv=(zw)=>{return E(fw(zw),0)},BR=({zx=`Component`,zy=``,zz=`Component`,aaa=vs(),aab=vs(),aac=vs(),aad=false,aae=``,aaf=r({code:``,language:`mint`}),aag=[],aah=[],aai=vs(),aaj=[],aak=[],aal=[],aam=[`preview`,`usage`,`api`],aan=``,aao=`localhost:3000`})=>{const aap=F(`preview`),aaq=()=>{const aar=[j({name:`preview`,title:`Preview`,disabled:false,dot:false,badge:``,titleStyle:``,icon:``,content:``}),j({name:`usage`,title:`Usage`,disabled:false,dot:false,badge:``,titleStyle:``,icon:``,content:``}),j({name:`api`,title:`API`,disabled:false,dot:false,badge:``,titleStyle:``,icon:``,content:``})];return vt(aar,(aas)=>{return vw(aam,aas.name)})},aat=(aau)=>{return (()=>{aap.value=aau.name})()};return G(`div`,{className:`jt`},[G(`h1`,{className:`ju`},[zx,G(`span`,{className:`jw`},[zz])]),G(`p`,{className:`jv`},[zy]),G(BM,{nr:aaq(),ns:aap.value,nt:`line`,nu:`#1989fa`,og:`#1989fa`,oh:`#646566`,oa:true,nx:`60px`,ny:`3px`,nw:200,ok:aat}),(E(aap.value,`preview`)?G(`div`,{},[aaa,(aad?G(`div`,{className:`jx`},[G(`div`,{className:`kc`},[aab]),G(`div`,{className:`kd`},[aac])]):G(`div`,{className:`jx`},[(E(ah.value,`mobile`)?G(`div`,{className:`jy`},[G(`div`,{className:`jz`},[G(`div`,{className:`ka`})]),G(`div`,{className:`kb`},[G(`div`,{className:`kc`},[aab]),G(`div`,{className:`kd`},[aac])])]):G(`div`,{className:`jy ke`},[G(`div`,{className:`kf`},[G(`div`,{className:`kg kh`}),G(`div`,{className:`kg ki`}),G(`div`,{className:`kg kj`}),G(`div`,{className:`kk`},[`🔒 ` + (bo(aao)?`localhost:3000`:aao)])]),G(`div`,{className:`kb kl`},[G(`div`,{className:`km`},[aab]),G(`div`,{className:`kn`},[aac])])]))]))]):(E(aap.value,`usage`)?G(`div`,{},[(!bo(aae)?G(`div`,{className:`ko`},[G(`h3`,{className:`kp`},[`Usage`]),G(`p`,{className:`kq`},[aae])]):null),(!bo(aaf.code)?G(`div`,{className:`kv`},[G(`div`,{className:`kw`},[G(`h3`,{className:`kx`},[`Code Example`])]),G(BQ,{zp:aaf.code,zq:aaf.language,zr:true})]):null),(()=>{const _0=[];const _1=aag;let _i=-1;for(let aav of _1){_i++;_0.push(G(`div`,{className:`kv`},[G(`div`,{className:`kw`},[G(`div`,{},[G(`h3`,{className:`kx`},[aav.title]),(!bo(aav.description)?G(`p`,{className:`ky`},[aav.description]):null)])]),G(BQ,{zp:aav.snippet.code,zq:aav.snippet.language,zr:true})]))};return _0})(),aai]):(E(aap.value,`api`)?G(`div`,{},[(!zv(aah)?G(`div`,{className:`ko`},[G(`h3`,{className:`kp`},[`Props`]),G(`table`,{className:`kr`},[G(`thead`,{},[G(`tr`,{},[G(`th`,{className:`ks`},[`Property`]),G(`th`,{className:`ks`},[`Description`]),G(`th`,{className:`ks`},[`Type`]),G(`th`,{className:`ks`},[`Default`])])]),G(`tbody`,{},[(()=>{const _0=[];const _1=aah;let _i=-1;for(let aaw of _1){_i++;_0.push(G(`tr`,{},[G(`td`,{className:`kt`},[G(`code`,{className:`ku`},[aaw.name])]),G(`td`,{className:`kt`},[aaw.description]),G(`td`,{className:`kt`},[aaw.type]),G(`td`,{className:`kt`},[aaw.defaultValue])]))};return _0})()])])]):null),(!zv(aaj)?G(`div`,{className:`ko`},[G(`h3`,{className:`kp`},[`Events`]),G(`table`,{className:`kr`},[G(`thead`,{},[G(`tr`,{},[G(`th`,{className:`ks`},[`Event`]),G(`th`,{className:`ks`},[`Description`]),G(`th`,{className:`ks`},[`Arguments`]),G(`th`,{className:`ks`},[`Type`])])]),G(`tbody`,{},[(()=>{const _0=[];const _1=aaj;let _i=-1;for(let aax of _1){_i++;_0.push(G(`tr`,{},[G(`td`,{className:`kt`},[G(`code`,{className:`ku`},[aax.name])]),G(`td`,{className:`kt`},[aax.description]),G(`td`,{className:`kt`},[aax.type]),G(`td`,{className:`kt`},[aax.defaultValue])]))};return _0})()])])]):null),(!zv(aak)?G(`div`,{className:`ko`},[G(`h3`,{className:`kp`},[`Methods`]),G(`table`,{className:`kr`},[G(`thead`,{},[G(`tr`,{},[G(`th`,{className:`ks`},[`Method`]),G(`th`,{className:`ks`},[`Description`]),G(`th`,{className:`ks`},[`Parameters`]),G(`th`,{className:`ks`},[`Returns`])])]),G(`tbody`,{},[(()=>{const _0=[];const _1=aak;let _i=-1;for(let aay of _1){_i++;_0.push(G(`tr`,{},[G(`td`,{className:`kt`},[G(`code`,{className:`ku`},[aay.name])]),G(`td`,{className:`kt`},[aay.description]),G(`td`,{className:`kt`},[aay.type]),G(`td`,{className:`kt`},[aay.defaultValue])]))};return _0})()])])]):null),(!zv(aal)?G(`div`,{className:`ko`},[G(`h3`,{className:`kp`},[`Slots`]),G(`table`,{className:`kr`},[G(`thead`,{},[G(`tr`,{},[G(`th`,{className:`ks`},[`Slot`]),G(`th`,{className:`ks`},[`Description`]),G(`th`,{className:`ks`},[`Type`]),G(`th`,{className:`ks`},[`Default`])])]),G(`tbody`,{},[(()=>{const _0=[];const _1=aal;let _i=-1;for(let aaz of _1){_i++;_0.push(G(`tr`,{},[G(`td`,{className:`kt`},[G(`code`,{className:`ku`},[aaz.name])]),G(`td`,{className:`kt`},[aaz.description]),G(`td`,{className:`kt`},[aaz.type]),G(`td`,{className:`kt`},[aaz.defaultValue])]))};return _0})()])])]):null),aai]):G(`div`,{},[aai]))))])},BS=({aba=`fadeIn`,abb=0.6,abc=`ease-out`,abd=0,abe=vs()})=>{const abf=()=>{const _={[`--w-a`]:aba,[`--w-b`]:gi(abb) + `s`,[`--w-c`]:abc,[`--w-d`]:gi(abd) + `s`};return _};return G(J,{},[G(`div`,{className:`iw`,style:K([`display:none;`])}),G(`div`,{className:`ix`,style:K([`display:none;`])}),G(`div`,{className:`iy`,style:K([`display:none;`])}),G(`div`,{className:`iz`,style:K([`display:none;`])}),G(`div`,{className:`ja`,style:K([`display:none;`])}),G(`div`,{className:`jb`,style:K([`display:none;`])}),G(`div`,{className:`jc`,style:K([`display:none;`])}),G(`div`,{className:`jd`,style:K([`display:none;`])}),G(`div`,{className:`je`,style:K([abf()])},[abe])])},abg=(abh)=>{return ((() => {
      if (abh.trim() === '') {
        return new T()
      }

      const value = Number(abh)

      if (Number.isNaN(value)) {
        return new T()
      }

      return P(S)((value))
    })())},abi=(abj)=>{return ((() => {
      let value = abj.value

      if (typeof value === "string") {
        return value
      } else {
        return ""
      }
    })())},BT=()=>{const abk=F(`fadeIn`),abl=F(0.6),abm=F(0),abn=F(`ease-out`),abo=F(0),abp=()=>{return [p({id:`fadeIn`,label:`Fade In`,code:`opacity: 0 → 1`}),p({id:`fadeInUp`,label:`Fade In Up`,code:`opacity: 0, translateY(30px) → opacity: 1, translateY(0)`}),p({id:`fadeInDown`,label:`Fade In Down`,code:`opacity: 0, translateY(-30px) → opacity: 1, translateY(0)`}),p({id:`slideInRight`,label:`Slide In Right`,code:`translateX(30px) → translateX(0)`}),p({id:`slideInLeft`,label:`Slide In Left`,code:`translateX(-30px) → translateX(0)`}),p({id:`scaleIn`,label:`Scale In`,code:`scale(0.9) → scale(1)`}),p({id:`zoomIn`,label:`Zoom In`,code:`scale(0) → scale(1)`}),p({id:`rotateIn`,label:`Rotate In`,code:`rotate(-180deg) → rotate(0)`})]},abq=(abr)=>{return D(()=>{abk.value=abr;abo.value=abo.value + 1})},abs=()=>{return (()=>{abo.value=abo.value + 1})()},abt=(abu)=>{return (()=>{abl.value=fy(abg(abu),0.6)})()},abv=(abw)=>{return (()=>{abm.value=fy(abg(abw),0)})()},abx=(aby)=>{return (()=>{abn.value=aby})()},abz=()=>{return G(BS,{aba:abk.value,abb:abl.value,abc:abn.value,abd:abm.value,"key":gi(abo.value),abe:G(`div`,{className:`kz`},[`Preview`])})},aca=(acb)=>{return fy(gb(xt(abp(),(acc)=>{return E(acc.id,acb)}),(acd)=>{return acd.label}),`Unknown`)},ace=()=>{return G(`div`,{},[G(`h3`,{className:`la`},[`Animation Controls`]),G(`div`,{className:`lb`},[`Active: `,G(`strong`,{},[aca(abk.value)])]),G(`div`,{className:`lc`},[G(`label`,{className:`ld`},[`Duration`,G(`span`,{className:`le`},[gi(abl.value) + `s`])]),G(`input`,{"type":`range`,"min":`0.1`,"max":`3`,"step":`0.1`,"value":gi(abl.value),"onInput":(acf)=>{return abt(abi(acf.target))},className:`lf`})]),G(`div`,{className:`lc`},[G(`label`,{className:`ld`},[`Delay`,G(`span`,{className:`le`},[gi(abm.value) + `s`])]),G(`input`,{"type":`range`,"min":`0`,"max":`2`,"step":`0.1`,"value":gi(abm.value),"onInput":(acg)=>{return abv(abi(acg.target))},className:`lf`})]),G(`div`,{className:`lc`},[G(`label`,{className:`ld`},[`Easing Function`]),G(`select`,{"value":abn.value,"onChange":(ach)=>{return abx(abi(ach.target))},className:`lg`},[G(`option`,{"value":`ease-out`},[`ease-out (recommended)`]),G(`option`,{"value":`ease-in`},[`ease-in`]),G(`option`,{"value":`ease-in-out`},[`ease-in-out`]),G(`option`,{"value":`linear`},[`linear`]),G(`option`,{"value":`cubic-bezier(0.4, 0, 0.2, 1)`},[`cubic-bezier: smooth`]),G(`option`,{"value":`cubic-bezier(0.34, 1.56, 0.64, 1)`},[`cubic-bezier: bouncy ⭐`]),G(`option`,{"value":`cubic-bezier(0.68, -0.55, 0.265, 1.55)`},[`cubic-bezier: back`]),G(`option`,{"value":`cubic-bezier(0.175, 0.885, 0.32, 1.275)`},[`cubic-bezier: anticipate`])])]),G(`button`,{"onClick":(aci)=>{return abs()},className:`lh`},[`▶ Replay Animation`])])},acj=()=>{return [s({title:`Basic Usage`,description:`Simple fade-in animation with default settings`,snippet:r({code:`<EnterExit\n` + `  animation="fadeIn"\n` + `  duration={0.6}\n` + `  content={\n` + `    <div>"Hello World"</div>\n` + `  }/>`,language:`mint`})}),s({title:`With Replay Control`,description:`Use the key prop to trigger animation replay`,snippet:r({code:`component MyPage {\n` + `  state key : Number = 0\n\n` + `  fun replay : Promise(Void) {\n` + `    next { key: key + 1 }\n` + `  }\n\n` + `  fun render : Html {\n` + `    <>\n` + `      <EnterExit\n` + `        animation="${abk.value}"\n` + `        duration={${gi(abl.value)}}\n` + `        easing="${abn.value}"\n` + `        delay={${gi(abm.value)}}\n` + `        key={Number.toString(key)}\n` + `        content={\n` + `          <div>"Your content here"</div>\n` + `        }/>\n\n` + `      <button onClick={(e) { replay() }}>"Replay"</button>\n` + `    </>\n` + `  }\n` + `}`,language:`mint`})}),s({title:`Advanced: Multiple Elements`,description:`Stagger animations with different delays`,snippet:r({code:`<div>\n` + `  <EnterExit\n` + `    animation="fadeInUp"\n` + `    duration={0.5}\n` + `    delay={0}\n` + `    content={<h1>"Title"</h1>}/>\n\n` + `  <EnterExit\n` + `    animation="fadeInUp"\n` + `    duration={0.5}\n` + `    delay={0.2}\n` + `    content={<p>"Subtitle"</p>}/>\n\n` + `  <EnterExit\n` + `    animation="fadeInUp"\n` + `    duration={0.5}\n` + `    delay={0.4}\n` + `    content={<button>"Action"</button>}/>\n` + `</div>`,language:`mint`})}),s({title:`Custom Timing Function`,description:`Use cubic-bezier for smooth custom easing`,snippet:r({code:`<EnterExit\n` + `  animation="scaleIn"\n` + `  duration={0.8}\n` + `  easing="cubic-bezier(0.34, 1.56, 0.64, 1)"\n` + `  content={\n` + `    <div class="card">"Bouncy animation"</div>\n` + `  }/>`,language:`mint`})})]},ack=()=>{return [q({name:`animation`,description:`Animation type to apply. Available: fadeIn, fadeInUp, fadeInDown, slideInRight, slideInLeft, scaleIn, zoomIn, rotateIn`,type:`String`,defaultValue:`"fadeIn"`}),q({name:`duration`,description:`Animation duration in seconds`,type:`Number`,defaultValue:`0.6`}),q({name:`easing`,description:`CSS timing function. Available: ease-out, ease-in, ease-in-out, linear, or any cubic-bezier()`,type:`String`,defaultValue:`"ease-out"`}),q({name:`delay`,description:`Delay before animation starts (seconds)`,type:`Number`,defaultValue:`0`}),q({name:`content`,description:`Content to animate`,type:`Html`,defaultValue:`Html.empty()`}),q({name:`key`,description:`Unique key to trigger re-animation. Change this value to replay the animation`,type:`String`,defaultValue:`""`})]},acl=()=>{return G(`div`,{},[G(`div`,{className:`ln`},[G(`h3`,{className:`lo`},[`Available Animations`]),G(`table`,{className:`lq`},[G(`thead`,{},[G(`tr`,{},[G(`th`,{className:`lr`},[`Animation`]),G(`th`,{className:`lr`},[`Effect`]),G(`th`,{className:`lr`},[`Transform`])])]),G(`tbody`,{},[(()=>{const _0=[];const _1=abp();let _i=-1;for(let acm of _1){_i++;_0.push(G(`tr`,{},[G(`td`,{className:`ls`},[G(`code`,{className:`lt`},[acm.id])]),G(`td`,{className:`ls`},[acm.label]),G(`td`,{className:`ls`},[acm.code])]))};return _0})()])])]),G(`div`,{className:`ln`},[G(`h3`,{className:`lo`},[`Easing Functions`]),G(`table`,{className:`lq`},[G(`thead`,{},[G(`tr`,{},[G(`th`,{className:`lr`},[`Easing`]),G(`th`,{className:`lr`},[`Description`]),G(`th`,{className:`lr`},[`Best For`])])]),G(`tbody`,{},[G(`tr`,{},[G(`td`,{className:`ls`},[G(`code`,{className:`lt`},[`ease-out`])]),G(`td`,{className:`ls`},[`Starts fast, ends slow`]),G(`td`,{className:`ls`},[`Entering elements ⭐ recommended`])]),G(`tr`,{},[G(`td`,{className:`ls`},[G(`code`,{className:`lt`},[`ease-in`])]),G(`td`,{className:`ls`},[`Starts slow, ends fast`]),G(`td`,{className:`ls`},[`Exiting elements`])]),G(`tr`,{},[G(`td`,{className:`ls`},[G(`code`,{className:`lt`},[`ease-in-out`])]),G(`td`,{className:`ls`},[`Slow start and end`]),G(`td`,{className:`ls`},[`Looping animations`])]),G(`tr`,{},[G(`td`,{className:`ls`},[G(`code`,{className:`lt`},[`linear`])]),G(`td`,{className:`ls`},[`Constant speed`]),G(`td`,{className:`ls`},[`Loading indicators`])])])])]),G(`div`,{className:`ln`},[G(`h3`,{className:`lo`},[`Custom Cubic-Bezier Functions`]),G(`p`,{className:`lp`},[`Try these pre-made cubic-bezier curves in the preview above:`]),G(`table`,{className:`lq`},[G(`thead`,{},[G(`tr`,{},[G(`th`,{className:`lr`},[`Name`]),G(`th`,{className:`lr`},[`Cubic-Bezier`]),G(`th`,{className:`lr`},[`Effect`])])]),G(`tbody`,{},[G(`tr`,{},[G(`td`,{className:`ls`},[`Smooth`]),G(`td`,{className:`ls`},[G(`code`,{className:`lt`},[`cubic-bezier(0.4, 0, 0.2, 1)`])]),G(`td`,{className:`ls`},[`Smooth acceleration`])]),G(`tr`,{},[G(`td`,{className:`ls`},[`Bouncy ⭐`]),G(`td`,{className:`ls`},[G(`code`,{className:`lt`},[`cubic-bezier(0.34, 1.56, 0.64, 1)`])]),G(`td`,{className:`ls`},[`Playful bounce effect`])]),G(`tr`,{},[G(`td`,{className:`ls`},[`Back`]),G(`td`,{className:`ls`},[G(`code`,{className:`lt`},[`cubic-bezier(0.68, -0.55, 0.265, 1.55)`])]),G(`td`,{className:`ls`},[`Goes back before moving forward`])]),G(`tr`,{},[G(`td`,{className:`ls`},[`Anticipate`]),G(`td`,{className:`ls`},[G(`code`,{className:`lt`},[`cubic-bezier(0.175, 0.885, 0.32, 1.275)`])]),G(`td`,{className:`ls`},[`Slight overshoot at the end`])])])]),G(`p`,{className:`lp`},[`💡 Tip: Use `,G(`code`,{className:`lt`},[`cubic-bezier: bouncy`]),` from the easing selector to see the effect in real-time!`])])])},acn=()=>{return G(`div`,{className:`li`},[G(`h3`,{className:`la`},[`Choose Animation Type`]),G(`div`,{className:`lj`},[(()=>{const _0=[];const _1=abp();let _i=-1;for(let aco of _1){_i++;_0.push(G(`div`,{"onClick":(acp)=>{return abq(aco.id)},className:(E(abk.value,aco.id)?`animationCardActive`:``) + ` lk`},[G(`div`,{className:`ll`},[aco.label]),G(`div`,{className:`lm`},[aco.code])]))};return _0})()])])};return G(BR,{zx:`EnterExit`,zy:`Create smooth enter and exit animations for your elements. Adjust duration, delay, and easing to see the effects in real-time.`,zz:`Component`,aaa:acn(),aab:abz(),aac:ace(),aae:`Wrap any content with the EnterExit component to apply animations. The component automatically handles animation timing and easing. Use the key prop to trigger replay - changing the key value will restart the animation.`,aag:acj(),aah:ack(),aai:acl(),aam:[`preview`,`usage`,`api`]})},acq=(acr)=>{return (acr.replace(/\b[a-z]/g, char => char.toUpperCase()))},BU=()=>{const acs=()=>{return M(an.value,[[`introduction`,()=>{return G(BB,{})}],[`home`,()=>{return G(J,{},[G(`h1`,{className:`is`},[`Introduction`]),G(`p`,{className:`iu`},[`Welcome to the Mint UI Component Library. `,`This is a comprehensive collection of reusable components.`]),G(`h2`,{className:`it`},[`Getting Started`]),G(`p`,{className:`iu`},[`Browse through the sidebar to explore different components.`])])}],[`quickstart`,()=>{return G(J,{},[G(`h1`,{className:`is`},[`Quickstart Guide`]),G(`p`,{className:`iu`},[`Get started quickly with our component library.`]),G(`div`,{className:`iv`},[`mint install my-component`])])}],[`advanced-usage`,()=>{return G(J,{},[G(`h1`,{className:`is`},[`Advanced Usage`]),G(`p`,{className:`iu`},[`Learn advanced techniques and patterns.`]),G(`h2`,{className:`it`},[`Custom Styling`]),G(`p`,{className:`iu`},[`You can customize components using CSS variables.`])])}],[`button`,()=>{return G(J,{},[G(`h1`,{className:`is`},[`Button Component`]),G(`p`,{className:`iu`},[`Buttons allow users to take actions with a single tap.`]),G(`h2`,{className:`it`},[`Basic Usage`]),G(`div`,{className:`iv`},[`<button>Click me</button>`])])}],[`calendar`,()=>{return G(J,{},[G(`h1`,{className:`is`},[`Calendar Component`]),G(`p`,{className:`iu`},[`Calendar component for date selection.`])])}],[`badge`,()=>{return G(J,{},[G(`h1`,{className:`is`},[`Badge Component`]),G(`p`,{className:`iu`},[`Badge is used to display notification counts or status.`])])}],[`codes`,()=>{return G(BE,{})}],[`themes`,()=>{return G(BG,{})}],[`video-player`,()=>{return G(BJ,{})}],[`matrix`,()=>{return G(BL,{})}],[`tabs`,()=>{return G(BN,{})}],[`address-edit`,()=>{return G(BP,{})}],[`enter-exit`,()=>{return G(BT,{})}],[`gestures`,()=>{return G(J,{},[G(`h1`,{className:`is`},[`Gestures Animations`]),G(`p`,{className:`iu`},[`Interactive gesture-based animations. Content coming soon...`])])}],[`scroll`,()=>{return G(J,{},[G(`h1`,{className:`is`},[`Scroll Animations`]),G(`p`,{className:`iu`},[`Scroll-triggered reveal animations. Content coming soon...`])])}],[`keyframes`,()=>{return G(J,{},[G(`h1`,{className:`is`},[`Keyframes`]),G(`p`,{className:`iu`},[`Complex animation sequences. Content coming soon...`])])}],[`transforms`,()=>{return G(J,{},[G(`h1`,{className:`is`},[`Transforms`]),G(`p`,{className:`iu`},[`Rotation, scale, and transform animations. Content coming soon...`])])}],[`spring`,()=>{return G(J,{},[G(`h1`,{className:`is`},[`Spring Physics`]),G(`p`,{className:`iu`},[`Physics-based spring animations. Content coming soon...`])])}],[`orchestration`,()=>{return G(J,{},[G(`h1`,{className:`is`},[`Orchestration`]),G(`p`,{className:`iu`},[`Stagger and sequence animations. Content coming soon...`])])}],[`not-found`,()=>{return G(J,{},[G(`h1`,{className:`is`},[`404 - Page Not Found`]),G(`p`,{className:`iu`},[`The page you are looking for does not exist.`])])}],[null,()=>{return G(J,{},[G(`h1`,{className:`is`},[acq(an.value)]),G(`p`,{className:`iu`},[`This is the `,an.value,` page. Content coming soon...`]),G(`p`,{className:`iu`},[`Section: `,aq.value])])}]])};return G(`div`,{className:`ir`},[acs()])},act=G(`svg`,{dangerouslySetInnerHTML:{__html:`<path d="M35 0v.351h.185c.17 0 .329.071.475.212.147.118.271.27.37.457.098.19.172.391.22.599.049.21.073.398.073.562v19.53c0 .186-.024.399-.074.633a2.52 2.52 0 0 1-.22.598c-.094.183-.22.35-.369.494a.675.675 0 0 1-.475.21H35v.353h4.005v-.354h-.184a.717.717 0 0 1-.514-.209 2.799 2.799 0 0 1-.405-.494 2.51 2.51 0 0 1-.22-.598 3.136 3.136 0 0 1-.074-.634V3.518l9.002 20.48L56.09 2.43V21.71c0 .187-.024.4-.074.634a1.85 1.85 0 0 1-.256.598c-.097.187-.219.353-.365.494a.68.68 0 0 1-.48.21h-.183v.353h5.216v-.354h-.183a.723.723 0 0 1-.515-.209 2.79 2.79 0 0 1-.403-.494 2.51 2.51 0 0 1-.22-.598 3.135 3.135 0 0 1-.074-.634V2.181c0-.164.025-.352.074-.563a2.52 2.52 0 0 1 .22-.598c.123-.187.256-.34.403-.457a.723.723 0 0 1 .516-.212h.183V0h-4.152l-8.524 19.25L38.747 0zm60.884 2.181L92.21 3.306v.354c.613.024.967.21 1.066.563.121.329.185.69.185 1.09v3.132h-2.058v1.197h2.057v8.76c0 .68.01 1.348.036 2.007a5.88 5.88 0 0 0 .404 1.794c.22.54.576.972 1.066 1.301.49.329 1.177.494 2.058.494.711 0 1.236-.094 1.58-.282.367-.187.65-.364.844-.529a.767.767 0 0 1 .552-.211v-2.568h-.331a3.168 3.168 0 0 1-.88 1.689c-.442.47-.92.704-1.435.704-.343 0-.611-.082-.807-.246-.196-.187-.343-.446-.44-.775a5.305 5.305 0 0 1-.186-1.232 33.518 33.518 0 0 1-.037-1.654V9.642H100V8.446h-4.116zm-29.945.775c-.49 0-.907.165-1.25.494a1.651 1.651 0 0 0-.478 1.195c0 .47.16.857.478 1.162.343.305.76.458 1.249.458.49 0 .908-.153 1.25-.458.343-.305.514-.693.514-1.162 0-.47-.17-.867-.514-1.195a1.741 1.741 0 0 0-1.249-.494zm1.69 5.067L63.952 9.15v.316c.59.024.946.225 1.069.6.122.352.183.728.183 1.126v10.518c0 .187-.026.4-.074.634a2.48 2.48 0 0 1-.22.598c-.098.187-.22.354-.367.494a.717.717 0 0 1-.514.21V24h4.776v-.354a.722.722 0 0 1-.516-.209 1.887 1.887 0 0 1-.366-.494 2.51 2.51 0 0 1-.22-.598 3.136 3.136 0 0 1-.074-.634zm8.745.036-3.675 1.127v.317c.588.023.943.222 1.065.598.122.351.185.727.185 1.126V21.71c0 .187-.024.4-.074.634-.05.212-.137.415-.258.598-.097.187-.22.353-.365.494a.68.68 0 0 1-.48.21v.353h4.778v-.354a.717.717 0 0 1-.514-.209 4.506 4.506 0 0 1-.368-.494c-.099-.19-.173-.39-.221-.598a3.135 3.135 0 0 1-.074-.634v-8.583c0-.492.123-.963.37-1.409.268-.469.598-.865.99-1.195a5.285 5.285 0 0 1 1.397-.846 4.404 4.404 0 0 1 1.617-.316c.538 0 1.064.105 1.58.317a3.694 3.694 0 0 1 1.433.915c.417.422.747.95.992 1.583s.367 1.372.367 2.218v7.316c0 .187-.024.4-.074.634-.05.212-.137.414-.258.598-.097.187-.22.353-.366.494a.68.68 0 0 1-.48.21v.353h4.742v-.354a.722.722 0 0 1-.515-.21 4.506 4.506 0 0 1-.368-.493 2.51 2.51 0 0 1-.22-.598 3.135 3.135 0 0 1-.073-.634v-7.562c0-.681-.122-1.374-.367-2.077a5.284 5.284 0 0 0-1.103-1.97c-.515-.61-1.175-1.102-1.983-1.478-.809-.376-1.789-.564-2.94-.564-.686 0-1.287.071-1.801.212-.49.118-.932.281-1.324.492a4.7 4.7 0 0 0-.954.634 5.485 5.485 0 0 0-.662.598z"/>
    <path d="M25.17.004a4.599 4.599 0 0 0-1.394.597.48.48 0 0 0-.596-.435 6.74 6.74 0 0 0-1.905.823.48.48 0 0 0-.624-.34 7.053 7.053 0 0 0-2.401 1.489.515.515 0 0 0-.244-.323.478.478 0 0 0-.431-.015c-.46.209-1.574.826-2.709 2.29l.021.01c-1.285 1.314-2.407 2.785-3.159 4.85a.543.543 0 0 1-.436.365.47.47 0 0 1-.457-.21 3.648 3.648 0 0 0-.283-.376c-1.325 2.659-1.163 8.536.036 11.255 1.146 2.69 1.418 3.715 1.462 3.931.222-.722.604-1.954.683-2.216a52.335 52.334 0 0 1 1.28-3.709c-.999-1.844-1.144-4.452-.53-6.855.186-.729 1.086-.566.903.142-.474 1.84-.456 3.86.142 5.432a52.362 52.36 0 0 1 2.72-5.563 10.452 10.452 0 0 1 .138-3.5 3.682 3.682 0 0 1 .453-1.198c.416-.613 1.142-.08.736.518-.012.02-.015.02-.014.016l-.036.085a4.231 4.231 0 0 0-.214.658 7.92 7.92 0 0 0-.195 1.94 51.87 51.87 0 0 1 4.547-6.344c.462-.545 1.13.06.68.59a50.105 50.104 0 0 0-4.473 6.245 10.607 10.606 0 0 0 1.631-.94 4.526 4.526 0 0 0 .497-.415c.036-.035.056-.052.066-.06-.005.002-.005.001.008-.018.316-.603 1.176-.001.736.514a3.527 3.527 0 0 1-.86.793 15.98 15.98 0 0 1-2.934 1.58 51.404 51.402 0 0 0-2.664 5.456c1.52-.627 2.966-1.772 4.122-2.998.427-.49 1.121.224.635.654-1.46 1.55-3.307 2.968-5.264 3.608-.49 1.266-1.397 4.487-1.727 5.67.547-.61 1.898-1.779 5.155-3.097 4.125-1.57 5.65-4.046 6.119-5.046a.518.518 0 0 0-.208-.658A2.135 2.135 0 0 0 23.68 15a15.548 15.548 0 0 0 1.847-3.279.529.529 0 0 0-.004-.399.481.481 0 0 0-.273-.261 2.5 2.5 0 0 0-.478-.125 7.102 7.102 0 0 0 .914-2.782.502.502 0 0 0-.127-.377.488.488 0 0 0-.351-.164h-.021a7.68 7.68 0 0 0 .721-2.388.496.496 0 0 0-.436-.556 8.274 8.274 0 0 0 .502-1.878.509.509 0 0 0-.127-.407.478.478 0 0 0-.353-.162A5.486 5.486 0 0 0 25.99.815a.92.92 0 0 0-.087-.55c-.142-.316-.63-.262-.732-.26zM2.686.288c-.012 0-.02.003-.032.004a.587.587 0 0 0-.045.004c-.021.004-.044.006-.065.013a.313.313 0 0 0-.026.01c-.003 0-.003.002-.006.003a.49.49 0 0 0-.065.033c-.01.005-.021.009-.03.015a.488.488 0 0 0-.214.436A4.52 4.52 0 0 0 .745.412a1.02 1.02 0 0 1-.062.006l-.095.01L.526.44l-.04.009a1.13 1.13 0 0 0-.108.03C.357.485.338.495.317.504.303.51.287.514.273.522.252.532.235.545.215.559L.18.585C.16.602.14.617.124.637.116.645.111.658.104.667L.098.675a.375.375 0 0 0-.05.098.92.92 0 0 0-.011.556A5.518 5.518 0 0 0 .719 2.65a.484.484 0 0 0-.326.21.521.521 0 0 0-.07.422 8.376 8.376 0 0 0 .748 1.793.46.46 0 0 0-.27.18.494.494 0 0 0-.086.433 7.61 7.61 0 0 0 1.039 2.264h-.023a.496.496 0 0 0-.326.209.52.52 0 0 0-.076.394 7.06 7.06 0 0 0 1.28 2.628 2.454 2.454 0 0 0-.457.19.482.482 0 0 0-.235.294.534.534 0 0 0 .05.397 15.486 15.486 0 0 0 2.271 2.992 2.264 2.264 0 0 0-.476.27.513.513 0 0 0-.116.675c.03.047.064.099.101.153.04.057.084.115.131.178l.008.01a8.185 8.184 0 0 0 1.317 1.375l.02.017a9.299 9.298 0 0 0 .324.26c.051.038.103.073.155.11.07.052.142.102.216.153l.203.135c.064.042.124.085.19.126.076.048.155.094.233.14l.188.111c.086.048.175.095.263.142l.188.098c.096.048.196.095.294.141.063.03.12.06.184.09.112.05.227.098.341.146.043.018.083.038.127.056l.004.002.036.013c.093.037.879.262 1.542.41-.49-1.136-.8-2.63-.924-4.212a18.741 18.741 0 0 1-1.543-1.192c-.568-.406.105-1.247.616-.77.278.24.576.471.876.698a18.048 18.048 0 0 1 .284-3.547 17.257 17.257 0 0 1-3.166-1.317 3.753 3.753 0 0 1-1.007-.751c-.528-.505.335-1.248.738-.637.017.02.014.023.009.02.011.008.035.025.078.059a4.876 4.876 0 0 0 .58.39 11.42 11.42 0 0 0 1.855.828A53.467 53.466 0 0 0 4.855 5.52a54.048 54.047 0 0 0-2.213-2.285c-.54-.52.117-1.242.67-.709A55.397 55.396 0 0 1 8.87 8.824a8.46 8.46 0 0 0-.41-2.057 4.48 4.48 0 0 0-.297-.68l-.048-.09c0 .005-.001.007-.017-.013-.499-.596.227-1.247.738-.636a3.935 3.935 0 0 1 .614 1.236c.17.538.29 1.09.376 1.647.063-.13.125-.262.193-.381a.537.537 0 0 1 .303-.236.461.461 0 0 1 .361.042 1.9 1.9 0 0 1 .438.36c.651-1.54 1.555-3.081 2.664-4.326-.424-.511-1.31-1.196-1.343-1.223-.01-.008-.022-.01-.032-.017a.51.51 0 0 0-.385-.09.484.484 0 0 0-.326.236 2.509 2.509 0 0 0-.184.431l-.049-.043a9.845 9.845 0 0 0-.355-.325l-.053-.05a8.856 8.856 0 0 0-.396-.32L10.6 2.24a8.464 8.464 0 0 0-.406-.292l-.05-.03a7.403 7.403 0 0 0-.585-.347c-.018-.01-.034-.022-.051-.03l-.074-.038c-.037-.019-.072-.035-.108-.052l-.047-.022c-.042-.02-.084-.043-.124-.06l-.036-.016c-.041-.018-.08-.037-.119-.052l-.036-.013c-.036-.015-.074-.028-.11-.042l-.042-.015c-.029-.01-.062-.025-.09-.035l-.071-.026-.04-.011-.102-.033a.537.537 0 0 0-.127-.02h-.01c-.01.001-.02.005-.03.005-.027 0-.056 0-.082.006a.461.461 0 0 0-.178.083.516.516 0 0 0-.199.35A6.995 6.994 0 0 0 5.308.416H5.3A.477.477 0 0 0 5.192.41c-.016 0-.033.004-.049.006a.473.473 0 0 0-.408.427A6.735 6.735 0 0 0 2.739.29L2.735.286c-.017-.002-.034 0-.05 0z"/>`},viewBox:`0 0 100 24`,height:`24`,width:`100`}),acu=(acv)=>{return (acv.getUTCFullYear())},acw=()=>{return (new Date())},BV=()=>{H(()=>{(()=>{return af()})()},[]);return G(`div`,{className:`lu`},[G(AZ,{}),G(`div`,{className:`lv`},[G(BA,{bs:true}),G(`div`,{className:`lw`},[G(`div`,{className:`lx`},[G(BU,{}),G(`div`,{className:`ly`},[act,G(`small`,{},[`2018 - ${acu(acw())}`])])])])])])};export default ()=>{R(BV,{},V,[{await:false,path:`/`,decoders:[],mapping:[],handler:()=>{return at(`introduction`,`Essentials`)}},{await:false,path:`/introduction`,decoders:[],mapping:[],handler:()=>{return at(`introduction`,`Essentials`)}},{await:false,path:`/home`,decoders:[],mapping:[],handler:()=>{return at(`home`,`Essentials`)}},{await:false,path:`/quickstart`,decoders:[],mapping:[],handler:()=>{return at(`quickstart`,`Essentials`)}},{await:false,path:`/themes`,decoders:[],mapping:[],handler:()=>{return at(`themes`,`Essentials`)}},{await:false,path:`/advanced-usage`,decoders:[],mapping:[],handler:()=>{return at(`advanced-usage`,`Essentials`)}},{await:false,path:`/faq`,decoders:[],mapping:[],handler:()=>{return at(`faq`,`Essentials`)}},{await:false,path:`/changelog`,decoders:[],mapping:[],handler:()=>{return at(`changelog`,`Essentials`)}},{await:false,path:`/button`,decoders:[],mapping:[],handler:()=>{return at(`button`,`Basic Components`)}},{await:false,path:`/cell`,decoders:[],mapping:[],handler:()=>{return at(`cell`,`Basic Components`)}},{await:false,path:`/icon`,decoders:[],mapping:[],handler:()=>{return at(`icon`,`Basic Components`)}},{await:false,path:`/image`,decoders:[],mapping:[],handler:()=>{return at(`image`,`Basic Components`)}},{await:false,path:`/layout`,decoders:[],mapping:[],handler:()=>{return at(`layout`,`Basic Components`)}},{await:false,path:`/calendar`,decoders:[],mapping:[],handler:()=>{return at(`calendar`,`Form Components`)}},{await:false,path:`/checkbox`,decoders:[],mapping:[],handler:()=>{return at(`checkbox`,`Form Components`)}},{await:false,path:`/date-picker`,decoders:[],mapping:[],handler:()=>{return at(`date-picker`,`Form Components`)}},{await:false,path:`/field`,decoders:[],mapping:[],handler:()=>{return at(`field`,`Form Components`)}},{await:false,path:`/form`,decoders:[],mapping:[],handler:()=>{return at(`form`,`Form Components`)}},{await:false,path:`/badge`,decoders:[],mapping:[],handler:()=>{return at(`badge`,`Display Components`)}},{await:false,path:`/circle`,decoders:[],mapping:[],handler:()=>{return at(`circle`,`Display Components`)}},{await:false,path:`/collapse`,decoders:[],mapping:[],handler:()=>{return at(`collapse`,`Display Components`)}},{await:false,path:`/countdown`,decoders:[],mapping:[],handler:()=>{return at(`countdown`,`Display Components`)}},{await:false,path:`/video-player`,decoders:[],mapping:[],handler:()=>{return at(`video-player`,`Display Components`)}},{await:false,path:`/matrix`,decoders:[],mapping:[],handler:()=>{return at(`matrix`,`Display Components`)}},{await:false,path:`/tabs`,decoders:[],mapping:[],handler:()=>{return at(`tabs`,`Navigation Components`)}},{await:false,path:`/address-edit`,decoders:[],mapping:[],handler:()=>{return at(`address-edit`,`Business Components`)}},{await:false,path:`/codes`,decoders:[],mapping:[],handler:()=>{return at(`codes`,`Tools`)}},{await:false,path:`/qr-code`,decoders:[],mapping:[],handler:()=>{return at(`codes`,`Tools`)}},{await:false,path:`/barcode`,decoders:[],mapping:[],handler:()=>{return at(`codes`,`Tools`)}},{await:false,path:`/animations/enter-exit`,decoders:[],mapping:[],handler:()=>{return at(`enter-exit`,`Wū Animations`)}},{await:false,path:`/animations/gestures`,decoders:[],mapping:[],handler:()=>{return at(`gestures`,`Wū Animations`)}},{await:false,path:`/animations/scroll`,decoders:[],mapping:[],handler:()=>{return at(`scroll`,`Wū Animations`)}},{await:false,path:`/animations/keyframes`,decoders:[],mapping:[],handler:()=>{return at(`keyframes`,`Wū Animations`)}},{await:false,path:`/animations/transforms`,decoders:[],mapping:[],handler:()=>{return at(`transforms`,`Wū Animations`)}},{await:false,path:`/animations/spring`,decoders:[],mapping:[],handler:()=>{return at(`spring`,`Wū Animations`)}},{await:false,path:`/animations/orchestration`,decoders:[],mapping:[],handler:()=>{return at(`orchestration`,`Wū Animations`)}},{await:false,path:`*`,decoders:[],mapping:[],handler:()=>{return at(`not-found`,``)}}],false)};
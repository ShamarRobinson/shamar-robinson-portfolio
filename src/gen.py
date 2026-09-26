# -*- coding: utf-8 -*-
import base64, io, os
def U(p, m=None):
    b=open(p,'rb').read()
    if m is None:
        h=b[:16]
        if h[:4]==b'\x89PNG': m='image/png'
        elif h[:2]==b'\xff\xd8': m='image/jpeg'
        elif h[:4]==b'RIFF' and b[8:12]==b'WEBP': m='image/webp'
        elif b[4:8]==b'ftyp': m='video/mp4'
        elif b.lstrip()[:5] in (b'<?xml', b'<svg '): m='image/svg+xml'
        elif h[:5]==b'%PDF-': m='application/pdf'
        else: m='application/octet-stream'
    return "data:%s;base64,%s" % (m, base64.b64encode(b).decode())
F='f4/'; L='fin/'
import re as _re
from diagrams import DIAGRAMS
def slug(s):
    s=_re.sub(r'&[a-z]+;',' ',s)
    return _re.sub(r'[^a-z0-9]+','-',s.lower()).strip('-')

def gal(items):
    # One set of figures only; the page clones them at runtime for the
    # seamless leftward slide, so the data URIs stay single-copy on disk.
    cls='gal' + ('' if len(items)>=3 else ' gal-static')
    s='\n          <div class="%s" style="--n:%d">\n            <div class="gal-track">'%(cls,len(items))
    for it in items:
        if it[0] in ('plate','platec'):
            inner=''.join('<img src="%s" alt="">'%U(x[0]) for x in it[2])
            fc='gi plate' + (' colour' if it[0]=='platec' else '')
            s+='\n              <figure class="%s"><div class="pl%s">%s</div><figcaption>%s</figcaption></figure>'%(
                fc, ' pl4' if len(it[2])>1 else '', inner, it[1])
        else:
            s+='\n              <figure class="gi"><img src="%s" alt="%s"><figcaption>%s</figcaption></figure>'%(
                U(F+it[0]), it[1].replace('&amp;','and'), it[1])
    return s+'\n            </div>\n          </div>'

def rows(data):
    s='\n          <div class="split">'
    for lab,gl,w,v in data:
        s+=('\n            <div class="row"><div><span class="row-l">%s</span>'
            '\n              <span class="row-g">%s</span></div>'
            '\n              <span class="row-t"><span class="row-f" style="--w:%s"></span></span>'
            '<span class="row-v">%s</span></div>')%(lab,gl,w,v)
    return s+'\n          </div>'

def stack(c,vals):
    a=[.98,.84,.70,.58,.46,.36,.26,.18]
    s='\n          <div class="stack" role="img" aria-label="Time allocation">'
    for i,v in enumerate(vals):
        s+='\n            <div class="seg" style="flex:%s;background:rgb(var(--%s)/%s)"></div>'%(v,c,a[min(i,7)])
    return s+'\n          </div>'

# the mark in an opened role pane links out to the organisation it stands for
ORG_LINKS={
    'Warner Bros. Discovery':   'https://www.wbd.com/',
    'Legendary Entertainment':  'https://www.legendary.com/',
    'Disney Branded Television': 'https://www.disney.com/',
    'Disney Television Animation': 'https://thewaltdisneycompany.com/',
    'Cox Media Group':          'https://www.coxenterprises.com/',
    'The Coca-Cola Company':    'https://www.coca-colacompany.com/',
}


def tile(c, bd, slate, logo, org, role, term, rhythm, proofs, lead=None, vals=None,
         rws=None, drawer=None, gitems=None, crest=None, logocls='logo', logostyle='',
         logofull=False,
         video=None, vlabel=None, vsub=None, vposter='vid/poster.jpg', vzoom=False):
    sid=slug(org)
    h='\n      <article class="tile" style="--c:var(--%s)">'%c
    if bd: h+='\n        <div class="shot" style="background-image:url(%s)"></div>'%U(F+bd)
    h+='\n        <div class="rail"></div>'
    if slate: h+='\n        <div class="slate">%s</div>'%slate
    h+='\n        <div class="tile-in">'
    h+='\n          <div class="pane-media" data-media-for="%s"></div>'%sid
    h+='\n          <div class="tile-top">'
    if crest:
        h+='\n            <div class="crest">%s</div>'%crest
    else:
        _img=('<img class="%s%s" style="%s" src="%s" alt="%s">'%(
              logocls,' lfull' if logofull else '',logostyle,logo,org))
        _href=ORG_LINKS.get(org)
        h+=('\n            <a class="logolink" href="%s" target="_blank" rel="noopener" '
            'aria-label="%s (opens in a new tab)">%s</a>')%(_href,org,_img) if _href \
           else '\n            '+_img
    h+=('\n            <div class="tile-id">\n              <h3 class="org">%s</h3>'
        '\n              <p class="role">%s</p>\n            </div>'
        '\n            <div class="term">%s</div>\n          </div>')%(org,role,term)
    h+='\n          <p class="rhythm">%s</p>'%rhythm
    h+='\n          <div class="proof">'+''.join('<span class="pf">%s</span>'%p for p in proofs)+'</div>'
    if vals:
        h+='\n          <div class="tl">A hundred points of the day</div>'
        h+='\n          <p class="lead">%s</p>'%lead
        h+=stack(c,vals); h+=rows(rws)
    if drawer:
        h+=('\n          <details><summary><span class="cvr">+</span>Systems, network &amp; signature deliverable</summary>'
            '\n            <div class="drawer">')
        for k,body in drawer:
            h+='\n              <div><div class="dk">%s</div>%s</div>'%(k,body)
        h+='\n            </div>\n          </details>'
    if gitems: h+=gal(gitems)
    h+='\n        </div>\n      </article>'
    pane='\n    <div class="pane" id="p-%s" hidden>%s\n    </div>'%(sid,h)

    # vzoom: the clip is composed inset for the wide pane, so the deck tile
    # scales past the soft edge fill to sit flush like every other tile.
    media=('<video class="dt-video%s" autoplay muted loop playsinline preload="auto" poster="%s" '
           'aria-label="%s showreel"><source src="%s" type="video/mp4"></video>'
           )%(' dt-inset' if vzoom else '',U(vposter),vlabel or org,video) if video else \
          '<div class="dt-ph"><span class="dt-phl">Video pending</span></div>'
    badge=('<span class="dt-crest">%s</span>'%crest) if crest else \
          ('<img class="dt-logo%s" src="%s" alt="">'%(' lfull' if logofull else '',logo))
    deck=('\n      <button class="dtile" style="--c:var(--%s)" data-pane="p-%s" type="button" '
          'aria-haspopup="dialog"><span class="dt-media">%s</span><span class="dt-scrim"></span>'
          '<span class="dt-rail"></span><span class="dt-body">%s'
          '<span class="dt-title">%s</span><span class="dt-sub">%s</span>'
          '<span class="dt-term">%s</span></span></button>')%(c,sid,media,badge,org,role,term)
    return (deck,pane)

def tags(*t): return '<div class="tags">'+''.join('<span class="tag">%s</span>'%x for x in t)+'</div>'
def ul(*items): return '<ul class="dl">'+''.join('<li>%s</li>'%x for x in items)+'</ul>'

LG={'wbd':U(L+'wbd_color.svg'), 'lgd':U(L+'lgd.svg'),
    'dis':U(L+'disney.svg'), 'dtva':U(L+'dtva.png'),
    'cox':U(L+'coxmg.png'), 'coke':U(L+'cocacola.png'),
    'tlv':U(L+'turbolv.webp')}
NW=[('v3/nw_dch.svg','image/webp'),('v3/nw_dxd.svg','image/webp'),
    ('v3/nw_djr.png','image/png'),('v3/nw_dplus.png','image/png')]

T=[]
T.append(tile('wbd','bd_wbd.jpg','Warner Bros. Studios &middot; Burbank',LG['wbd'],
 'Warner Bros. Discovery','Sr. Analyst &mdash; Financial Contracts &amp; Reporting Administration',
 'Aug 2023 &mdash; Jun 2025',
 'When a film or show earns money, contracts decide who gets paid and how much. I read those contracts and produced the abstract the payment system calculated from &mdash; then tracked every deadline attached to it. A quarterly cycle with fixed milestones, a weekly status update, and deadlines set by contract rather than by us.',
 ['1,000+ contracts analysed','47 open items carried to completion','4 partner packages issued quarterly'],
 'Nearly <em>a third</em> of the role was reading contract sets and building the abstract every payment calculated from.',
 [30,20,15,12,12,8,3],
 [('Contract analysis &amp; abstract preparation','Read the signed contracts, identify everyone entitled to a share, determine which financial definition governs, then build the master settings record the payment system calculates from.','100%','30%'),
  ('Stakeholder inquiry &amp; escalation','Tracking production costs, tax credits and legal determinations across roughly a dozen departments, none of which reported to me.','67%','20%'),
  ('Preparation, data gathering &amp; report pulls','Working the preparation checklist, retrieving agreements, and extracting cost and revenue reports from SAP and the reporting system into Excel.','50%','15%'),
  ('Review cycles &amp; rework','Peer and management review, reissuing corrected abstracts, and serving as first reviewer on colleagues&rsquo; work.','40%','12%'),
  ('Workflow tracking &amp; status reporting','Running the ticket queue and a weekly status workbook that scored every open item on an eight-stage progress scale.','40%','12%'),
  ('Recurring quarterly packages','Four partner reporting packages, each on its own contractual deadline, plus the chart updates behind them.','27%','8%'),
  ('Documentation, SOPs &amp; knowledge transfer','Writing process documentation and the department procedures guide, and training peers on method.','10%','3%')],
 [('Systems',tags('SAP','Business Objects','Excel &mdash; Power Query','Jira','SharePoint')),
  ('Who I worked with',ul('Pulled information from roughly 12 departments &mdash; production finance, legal, tax incentives, rights',
   'Handed work off to the teams that configured payments, issued statements and forecast cash',
   'Outside the company: co-financing partners, talent representatives, external auditors')),
  ('Signature deliverable',ul('<b>Partner statement packages</b> &mdash; three monthly reports consolidated into one package per partner, four partners, every quarter',
   'A status workbook leadership could read without calling a meeting'))],
 [('g_wbd1.jpg','Warner Bros. Discovery'),('g_wbd2.jpg','The backlot at golden hour'),
  ('g_wbd4.jpg','Networks &amp; brands'),('g_wbd3.jpg','Warner Bros. Discovery &middot; Paramount')],
 logofull=True,
 video=U('vid/wbd_reel.mp4','video/mp4'), vlabel='Warner Bros. Discovery',
 vsub='One hundred years &middot; the catalogue these statements reported on',
 vposter='vid/wbd_poster.jpg'))

T.append(tile('lgd','bd_lgd.jpg','Legendary &middot; Film &amp; Television',LG['lgd'],
 'Legendary Entertainment','Contract Administration Manager &mdash; Business &amp; Legal Affairs',
 'Jul &mdash; Nov 2022',
 'Ran the calendar of dates by which the studio had to decide whether to extend its television deals, drafted every agreement that followed those decisions, and represented the business side on the team building the studio&rsquo;s rights database. A union filing went out every Friday; a report fed corporate finance every quarter.',
 ['15 department functions owned','20% of the role on the systems build','Fixed-term engagement, system delivered'],
 'Three functions carried <em>equal weight</em>: the option calendar, writer and producer deals, and the rights system build.',
 [20,20,20,10,10,8,8,5],
 [('Options &amp; rights','Every deadline by which the studio had to decide whether to extend a deal, plus the amendments, notices and payment paperwork each decision triggered.','100%','20%'),
  ('Development writers &amp; producers','Tracking writing milestones and the payments attached to them, from start paperwork through first-look and overall deal schedules.','100%','20%'),
  ('Rights management system build','On the core team building the studio&rsquo;s rights database as the business-side voice, defining how contracts and contacts were structured, then entering deals live as they closed.','100%','20%'),
  ('Series summaries &amp; status charts','Condensing fees, royalties, profit participation and option dates into one reference used to review each season&rsquo;s budget.','50%','10%'),
  ('Union filings &amp; credits','Weekly submissions to the writers&rsquo;, directors&rsquo; and actors&rsquo; guilds &mdash; minimum payments, signatory status, credit determinations and waivers.','50%','10%'),
  ('Episodic writers &amp; directors','Moving script and directing agreements from draft to signature, including on-set signing and union submission.','40%','8%'),
  ('Profit participation, invoices &amp; copyright','Profit-sharing summaries for talent, outside counsel invoices, episode copyright registration and music agreements.','40%','8%'),
  ('Financial quarter close','Keeping tracking charts current through the quarter so quarter-end was a review rather than a reconstruction, then submitting to corporate finance.','25%','5%')],
 [('Systems',tags('FilmTrack','Excel','iManage','AdobeSign','Asana','Box')),
  ('Who I worked with',ul('Creative and development, production, and Legendary corporate',
   'Corporate finance and accounting; post production for credits',
   'Outside the company: WGA, DGA, SAG-AFTRA, talent agencies, US Copyright Office')),
  ('Signature deliverable',ul('<b>Commencement and delivery chart</b> &mdash; updated continuously, so quarter end was a review, not a reconstruction',
   'Option expiration notices sent with a recommendation attached, not just a date'))],
 [('plate','The Legendary mark',[(L+'lgd.svg','image/svg+xml')]),
  ('g_lgd3.jpg','Legendary Entertainment'),('g_lgd1.jpg','Film catalogue'),('g_lgd2.jpg','Television catalogue')],
 video=U('vid/reel.mp4','video/mp4'), vlabel='Legendary Entertainment',
 vsub='Film &middot; Television &middot; the slate these contracts covered'))

T.append(tile('dbt','bd_dbt.jpg','Alameda Avenue &middot; Burbank',U(F+'lg_twdc.png'),
 'Disney Branded Television','Contract Administrator &mdash; Business &amp; Legal Affairs',
 'Nov 2021 &mdash; Jul 2022',
 'Held the accuracy of the deal database that Disney Channel, Disney XD, Disney Junior and Disney+ all reported from &mdash; the single source of truth everyone else built on &mdash; and wrote the recurring confidential deal update read by senior management and corporate finance.',
 ['500+ agreements tracked','4 platforms served','11-person contract team'],
 '<em>Thirty percent</em> went to keeping the deal database clean enough that leadership could trust the report built on top of it.',
 [30,16,14,10,9,8,7,6],
 [('Deal database accuracy','Daily entry and cleanup in Salesforce, the single database the department treated as the source of truth for deal requests, production deals and licenses.','100%','30%'),
  ('Deal term entry &amp; agreement tracking','Logging options, overall deals, licenses, pickups and purchase letters across more than 500 agreements.','53%','16%'),
  ('Execution &amp; agreement coordination','Routing agreements for signature, filing them, and reconciling the paper trail against the electronic one.','47%','14%'),
  ('On-screen credits review','Checking draft and final on-screen credits against what each contract promised, plus title clearance with corporate legal.','33%','10%'),
  ('Reporting to senior management','The recurring confidential deal update &mdash; data from productions running at the same time across four platforms, normalized into one readable format.','30%','9%'),
  ('Child performer compliance','Work permits and education requirements for minors on set &mdash; externally set deadlines carrying real legal exposure if missed.','27%','8%'),
  ('Production &amp; season schedule data','Tracking production and release schedules, greenlight dates, and the contractual triggers tied to them.','23%','7%'),
  ('System testing, cleanup &amp; SOPs','Testing and cleaning platform data as systems changed, plus maintaining the department administration handbook.','20%','6%')],
 [('Systems',tags('Salesforce','BLAST','DocuSign','SharePoint','Excel','PowerPoint')),
  ('Who I worked with',ul('Production teams across Disney Channel, XD, Junior and Disney+',
   'Programming and development, casting administration, post production',
   'Senior leadership, corporate finance, corporate legal for title clearance')),
  ('Signature deliverable',ul('<b>The confidential deal update</b> &mdash; written to lead with status and exposure',
   'The test: could leadership act on it without a follow-up question'))],
 [('plate','Disney Channel &middot; XD &middot; Junior &middot; Disney+',NW),
  ('g_dbt1.jpg','3800 W Alameda Avenue'),('g_dbt2.jpg','The Disney Channel building'),
  ('g_dbt4.jpg','Disney Branded Television')],
 video=U('vid/dbt_reel.mp4','video/mp4'), vlabel='Disney Channel',
 vposter='vid/dbt_poster.jpg', vzoom=True))

T.append(tile('dtva','bd_dtva.jpg','Sonora Avenue &middot; Glendale',LG['dtva'],
 'Disney Television Animation','Business &amp; Legal Affairs Coordinator',
 'Mar 2020 &mdash; Oct 2021',
 'Reviewed and wrote agreements at volume while supporting executives on deals that were still being negotiated, and built the tracking charts the department ran on. High volume, short turnaround, shaped by whichever negotiation was live that day.',
 ['400+ contracts reviewed','100+ agreements drafted','1 department-wide tracking system built'],
 '<em>Half</em> the role was reading and writing agreements. The rest was getting them signed, tracked and found again.',
 [25,25,20,15,10,5],
 [('Agreement review','Reading more than 400 agreements against the negotiated deal terms and department standards to confirm each one matched what was agreed.','100%','25%'),
  ('Drafting','Writing 100+ agreements &mdash; artist certificates, options, assignments and service agreements, both short and long form.','100%','25%'),
  ('Execution coordination','Getting agreements signed across talent agencies, management, outside counsel, labor relations and production finance, each moving on a different clock.','80%','20%'),
  ('Tracking charts, forms &amp; templates','Building and maintaining the department&rsquo;s deal-tracking charts and standardized form library, designed so the person who needed an answer could find it themselves.','60%','15%'),
  ('Negotiation &amp; executive support','Serving as the primary point of contact for executives on short-turnaround matters while deals were still open.','40%','10%'),
  ('Filing &amp; department administration','Keeping paper and electronic records reconciled to each other.','20%','5%')],
 [('Systems',tags('Excel','Standardized form library','DocuSign','Document repositories')),
  ('Who I worked with',ul('Business and legal affairs executives, labor relations, production teams',
   'Production finance and casting administration',
   'Outside the company: talent agencies, management, outside counsel')),
  ('Signature deliverable',ul('<b>Deal status tracking charts</b> &mdash; used department-wide and by outside consultants',
   'Built by deciding what each audience actually looked up, rather than publishing everything'))],
 [('g_dtva1.jpg','Disney Television Animation'),('g_dtva2.jpg','The slate'),
  ('g_dtva3.jpg','The Animation Building'),('g_dtva4.jpg','Proud Family &mdash; NAACP Image Award')],
 video=U('vid/dtva_reel.mp4','video/mp4'), vlabel='Disney Television Animation',
 vsub='Forty years of original series &middot; Glendale, California',
 vposter='vid/dtva_poster.jpg'))

T.append(tile('tlv','bd_tlv.jpg','Las Vegas &middot; Nevada',LG['tlv'],
 'Turbo LV','Founder','2025 &mdash; Present',
 'The same discipline, now end to end and under my own name. Setting businesses up legally, keeping their filings current, and handling the signings that have to be witnessed by a commissioned officer.',
 ['Multi-state compliance managed','USPTO trademark filings prepared','Commissioned notary &amp; loan signing agent'],
 None,None,None,
 [('Formation &amp; compliance',ul('Business entity formation and registration across multiple states',
   'Registered agent service, annual statements of information, license renewals')),
  ('Identity &amp; marks',ul('Business credit profile setup, including Dun &amp; Bradstreet registration',
   'End-to-end trademark filing through the US Patent and Trademark Office')),
  ('Execution',ul('Remote online notarization','Loan signing agent for real estate closings'))],
 [('g_tlv1.jpg','US Patent &amp; Trademark Office'),
  ('platec','Internal Revenue Service',[(F+'lg_irs.png','image/png')]),
  ('g_tlv3.jpg','Remote online notarisation'),
  ('platec','Business filings',[(F+'lg_biz.png','image/png')])],
 logostyle='height:50px;max-width:150px',
 video=U('vid/tlv_reel.mp4','video/mp4'), vlabel='Turbo LV',
 vposter='vid/tlv_poster.jpg'))

T.append(tile('dbt','bd_cox.jpg','Atlanta &middot; Georgia',LG['cox'],
 'Cox Media Group','Contract Coordinator &mdash; Campaign Fulfillment',
 'Aug 2018 &mdash; Mar 2019',
 'Loaded and activated television advertising contracts, then ran the operational reports that confirmed each advertiser&rsquo;s instructions were applied correctly across sales divisions nationwide &mdash; inside tight, non-negotiable production windows.',
 ['Nationwide sales divisions supported','Broadcast &amp; cable contracts activated','Time-sensitive production windows held'],
 None,None,None,
 [('What I ran',ul('Imported and activated advertising contracts into the traffic system',
   'Ran and analysed operational reports to verify ad-copy instructions applied correctly',
   'Processed revision requests with regional sales teams inside production deadlines')),
  ('Why it mattered',ul('An advertiser&rsquo;s spot airing wrong is revenue lost and a client call the same day',
   'The reports were the control that caught it before broadcast'))],
 [('g_cox1.jpg','The Atlanta campus at dusk'),('g_cox2.jpg','Cox Discovery Centre'),
  ('g_cox3.jpg','Broadcast &amp; brand galleries'),('g_cox4.jpg','Cox Enterprises')],
 video=U('vid/cox_reel.mp4','video/mp4'), vlabel='Cox Media Group',
 vposter='vid/cox_poster.jpg'))

T.append(tile('lgd','bd_coke.jpg','North Avenue &middot; Atlanta',LG['coke'],
 'The Coca-Cola Company','Account Coordinator &mdash; Marketing &amp; Sales Support',
 'Aug 2017 &mdash; Jan 2018',
 'Managed time-sensitive account data in Salesforce and QuickBase during natural disaster relief operations, coordinating nationwide project and research reporting through SAP.',
 ['Disaster relief account data managed','Salesforce &amp; QuickBase maintained','Nationwide reporting run through SAP'],
 None,None,None,
 [('What I ran',ul('Account data maintained in Salesforce and QuickBase under live operational pressure',
   'Nationwide project and research reporting coordinated through SAP')),
  ('Why it mattered',ul('Relief operations move on hours, not weeks',
   'The data had to be right the first time because there was no second pass'))],
 [('g_coke1.jpg','Corporate headquarters, Atlanta'),('g_coke2.jpg','The downtown sign'),
  ('g_coke3.jpg','Inside the offices'),('g_coke4.jpg','Real Magic')],
 video=U('vid/coke_reel.mp4','video/mp4'), vlabel='The Coca-Cola Company',
 vposter='vid/coke_poster.jpg'))

# Turbo LV is his own company, so it opens the section
_tlv = next(i for i, t in enumerate(T) if 'p-turbo-lv' in t[0])
T.insert(0, T.pop(_tlv))
DECK_WORK=''.join(t[0] for t in T)
PANES=''.join(t[1] for t in T)

# ══ generic deck tile + pane for the non-role sections ══
I='icons/'
def _panebody(body, verify, vianame, diagram):
    """Pane contents. Where a tile carries a diagram, the copy runs down the left
    and the screen sits on the right, sticking as the pane scrolls."""
    inner = body
    if verify:
        inner += ('\n          <div class="verify">'
                  '<a class="chip vchip" href="%s" target="_blank" rel="noopener">'
                  'Verify <span aria-hidden="true">&#8599;</span></a>'
                  '<span class="vnote">via %s</span></div>')%(verify, vianame)
    if not diagram:
        return inner
    return ('\n          <div class="pane-split">'
            '\n            <div class="pane-col">%s\n            </div>'
            '\n            <aside class="pane-dg"><div class="dgscreen">%s</div></aside>'
            '\n          </div>')%(inner, diagram)

def _panelogo(src, logofull, logodisc, link, label):
    """The mark in an opened pane, optionally linking out to the institution."""
    img = '<img class="logo%s%s" src="%s" alt="">'%(
        ' lfull' if logofull else '', ' lg-disc' if logodisc else '', src)
    if not link:
        return '\n            ' + img
    return ('\n            <a class="logolink" href="%s" target="_blank" rel="noopener" '
            'aria-label="%s (opens in a new tab)">%s</a>')%(link, label, img)


def unit(c, sid, title, sub, term, body, badge_img=None, badge_txt=None, video=None,
         vposter=None, vlabel=None, shot=None, img=None, logofull=False, logodisc=False,
         cert=None, certlabel=None, diagram=None, nobadge=False, screen=False,
         verify=None, vianame=None, phlabel=None, logolink=None, logolabel=None):
    pane=('\n    <div class="pane" id="p-%s" hidden>'
          '\n      <article class="tile" style="--c:var(--%s)">'
          '%s'
          '\n        <div class="rail"></div>'
          '\n        <div class="tile-in">'
          '\n          <div class="pane-media%s" data-media-for="%s">%s</div>'
          '\n          <div class="tile-top">%s'
          '\n            <div class="tile-id"><h3 class="org">%s</h3><p class="role">%s</p></div>'
          '\n            <div class="term">%s</div></div>'
          '%s\n        </div>\n      </article>\n    </div>')%(
          sid,c,
          ('\n        <div class="shot" style="background-image:url(%s)"></div>'%shot) if shot else '',
          (' pm-cert' if cert else ''), sid,
          ('<button class="certbtn" type="button" aria-label="Expand %s">'
           '<img class="cert" src="%s" alt="%s">'
           '<span class="cert-hint">Click to expand</span></button>'
           )%(certlabel or title, cert, certlabel or title) if cert else '',
          '' if nobadge else
          (_panelogo(badge_img, logofull, logodisc, logolink, logolabel or sub)
           if badge_img else ('\n            <div class="crest">%s</div>'%badge_txt)),
          title, sub, term, _panebody(body, verify, vianame, diagram))
    if video:
        media=('<video class="dt-video" autoplay muted loop playsinline preload="auto" poster="%s" '
               'aria-label="%s"><source src="%s" type="video/mp4"></video>')%(U(vposter),vlabel or title,video)
    elif diagram:
        media=diagram
    elif img:
        # a still stands in for a reel; the slow pan keeps the tile from reading as flat
        media='<img class="dt-shot" src="%s" alt="">'%img
    else:
        media='<div class="dt-ph"><span class="dt-phl">%s</span></div>'%(phlabel or 'Video pending')
    badge='' if nobadge else \
          (('<img class="dt-logo%s%s" src="%s" alt="">'%(
            ' lfull' if logofull else '', ' lg-disc' if logodisc else '', badge_img)) if badge_img else
           ('<span class="dt-crest">%s</span>'%badge_txt))
    deck=('\n      <button class="dtile%s" style="--c:var(--%s)" data-pane="p-%s" type="button" '
          'aria-haspopup="dialog"><span class="dt-media">%s</span><span class="dt-scrim"></span>'
          '<span class="dt-rail"></span><span class="dt-body">%s'
          '<span class="dt-title">%s</span><span class="dt-sub">%s</span>'
          '<span class="dt-term">%s</span></span></button>')%(' scr' if screen else '',c,sid,media,badge,title,sub,term)
    return (deck,pane)

def build(w,h3,plain,tech):
    return ('\n          <article class="build" style="margin-bottom:14px"><div class="build-w">%s</div>'
            '<h3>%s</h3><p class="plain">%s</p><p class="tech">%s</p></article>')%(w,h3,plain,tech)

# -- Deliverables & Outcomes: one tile per topic --
def grp(intro, groups):
    h='\n          <p class="rhythm" style="margin-top:22px">%s</p>'%intro
    h+='\n          <div class="drawer" style="padding-top:24px">'
    for k,items in groups:
        h+='\n            <div><div class="dk">%s</div><ul class="dl">%s</ul></div>'%(
            k, ''.join('<li>%s</li>'%x for x in items))
    return h+'\n          </div>'

B=[]
B.append(unit('wbd','dlv-deadlines','Recurring Deadlines',
  'Dates set by contract, not by the department','Every role',
  grp('A missed reporting date is a breach, not a late report. Most of these clocks were set by somebody else and did not move because the week was busy.',
   [('The quarterly cycle',[
      'Cumulative statement reporting keyed to the enterprise by-title cutoff',
      'Four partner packages due 45, 60 and 90 days after a single close',
      'Draft bonus and deferment schedules circulated two weeks before every theatrical release']),
    ('Weekly and daily',[
      'Guild worklist filed every Friday, regardless of what else was happening',
      'Weekly status update across the open pipeline',
      'Daily tracking against deadlines written into the agreements themselves']),
    ('Externally set',[
      'The option calendar &mdash; every expiry date non-negotiable',
      'Child performer work permits and education compliance, with real legal exposure',
      'Quarter-end reconciliation submitted to corporate finance'])]),
  diagram=DIAGRAMS['deadlines'], nobadge=True, screen=True))

B.append(unit('lgd','dlv-platform','Rights Management Platform',
  'Build &amp; integration, from the business side','2021 &mdash; 2025',
  grp('I sat on the build team as the business and legal affairs voice &mdash; translating what each group actually needed into how the system stored it. Getting everyone to agree on definitions was the hard part, not the software.',
   [('The build',[
      'Core build team for the studio rights platform at Legendary',
      'Defined the baseline contract and contact record structure',
      'Ran live entry as deals closed once the structure was set',
      'Twenty percent of the role by the department&rsquo;s own weighting']),
    ('Integration &amp; migration',[
      'Enterprise document management hierarchy built with IT during migration off the prior repository',
      'Platform entry, cleanup and testing cycles as systems changed',
      'Salesforce held as system of record at Disney Branded Television']),
    ('Why it held',[
      'Daily data integrity is what the reports leadership read were built on',
      'A rights platform fails on definitions long before it fails on code'])]),
  diagram=DIAGRAMS['platform'], nobadge=True, screen=True))

B.append(unit('tlv','dlv-sop','Workflow &amp; SOPs',
  'The written layer underneath the work','Every role',
  grp('How a task is done, who checks it, and what proves it was done right. Built so a department keeps running when the person who knew it is out, or gone.',
   [('Written standards',[
      'Department procedures guide',
      'Standardized form library, worked from wherever the deal allowed',
      'Administration handbook']),
    ('Controls',[
      'Seventeen-point preparation checklist completed per title with three sign-offs',
      'Eight-stage status legend with days due and proposed completion',
      'Maker-checker: preparer, peer reviewer, two approvers, with segregation of duties']),
    ('Self-service',[
      'Deal status tracking charts designed so the person who needed an answer could find it',
      'Which meant deciding what each audience looked up, rather than publishing everything'])]),
  diagram=DIAGRAMS['sops'], nobadge=True, screen=True))

B.append(unit('dbt','dlv-agreements','Agreement Types',
  'What came across the desk','1,900+ agreements',
  grp('Across four studios the agreement types varied, but the job did not: read it, capture what it obliges, and make sure the record matches what was agreed.',
   [('Talent &amp; production',[
      'Series regular and day player agreements',
      'Artist certificates, options, assignments and service agreements',
      'Start paperwork, booking and on-set signature']),
    ('Writers &amp; directors',[
      'Script agreements through full execution',
      'Director deal memos, writing steps and step amendments',
      'First-look and overall payment schedules']),
    ('Licensing &amp; distribution',[
      'Theatrical, home entertainment, television and video game agreements',
      'Music licensing and distribution agreements',
      'Pickup, release and purchase letters']),
    ('Corporate &amp; rights',[
      'Amendments, notices and waivers',
      'Participation abstracts and deferment schedules',
      'Episodic copyright registration with the US Copyright Office'])]),
  diagram=DIAGRAMS['agreements'], nobadge=True, screen=True))
DECK_BUILDS=''.join(b[0] for b in B); PANES+=''.join(b[1] for b in B)

# -- Section 02, second row: consolidated tiles (no company-named tiles) --
SK=[]
SK.append(unit('wbd','dlv-abstract','The Financial Abstract',
  'What every payment calculates from','1,000+ contracts analysed',
  grp('Before anyone gets paid, somebody has to read the signed deal and write down what it obliges in a form a payment system can execute. That record is the abstract. Nearly a third of the Warner Bros. Discovery role was building it.',
   [('What goes into one',[
      'The full contract set read end to end &mdash; agreement, amendments, side letters and assignments',
      'Every party entitled to a share identified, and on what basis',
      'Which financial definition governs, since a single title can carry several',
      'The terms the calculation turns on: percentages, breakpoints, caps, offsets and priorities']),
    ('The checks around it',[
      'A seventeen-point preparation checklist completed per title',
      'Peer first-level review, then two levels of management approval',
      'Cost and revenue pulls from SAP reconciled against the reporting system',
      'Reissue and rework whenever a determination changed upstream']),
    ('What it feeds',[
      'The settings the payment system calculates participations from',
      'Cumulative statement reporting keyed to the enterprise by-title cutoff',
      'Four partner statement packages a quarter, each on its own contractual deadline',
      'Deferment and bonus schedules circulated ahead of theatrical release']),
    ('Why it is the hard part',[
      'An abstract that reads the definition wrong pays the wrong number to the right person',
      'The error surfaces years later, in a participation audit, long after the money moved'])]),
  diagram=DIAGRAMS['abstract'], nobadge=True, screen=True))

SK.append(unit('dbt','dlv-stakeholders','Stakeholders',
  'Who the work came from, and who was waiting on it','Every role',
  grp('Almost none of this moves through an org chart. What matters is direction &mdash; which groups I pulled information from, who was blocked until I delivered, and who checked the work before it left.',
   [('Pulled inputs from',[
      'Production finance, tax incentives and cost reporting',
      'Business and legal affairs across theatrical, television, animation and games',
      'Home entertainment, international, consumer products and music',
      'Casting administration, story and credits, and central records']),
    ('Handed off to',[
      'The teams that configured payments and issued statements',
      'Cash forecasting, residuals and participation audit',
      'Corporate finance, on the quarterly reporting cycle',
      'Post production and credits, on determinations']),
    ('Reviewed by',[
      'Peer first-level review',
      'Department leadership, two levels of approval',
      'Senior leadership and hub leads on the recurring packages']),
    ('Outside the company',[
      'WGA, DGA and SAG-AFTRA, plus the AMPTP',
      'Talent agencies, management, attorneys and business managers',
      'Co-financing and distribution partners, and their counsel',
      'Outside counsel, third-party auditors and the US Copyright Office'])]),
  diagram=DIAGRAMS['stakeholders'], nobadge=True, screen=True))

SK.append(unit('tlv','dlv-filings','Registration, Incorporation, and Filings',
  'Standing entities up, and keeping rights on record','Multi-state &amp; federal',
  grp('Two kinds of filing run through the work: the ones that bring a business into existence and keep it in good standing, and the ones that put a right or a credit on record with a body outside the company. Both run on deadlines, and both are unforgiving about form.',
   [('Entity formation &amp; standing',[
      'Business entity formation and registration across multiple states',
      'Registered agent service, annual statements of information and license renewals',
      'Federal tax identification obtained as part of formation',
      'Business credit profile setup, including Dun &amp; Bradstreet registration']),
    ('Marks &amp; copyright',[
      'End-to-end trademark filing through the US Patent and Trademark Office',
      'Episodic copyright registration with the US Copyright Office',
      'Title clearance coordinated with corporate legal']),
    ('Guild &amp; union submissions',[
      'A worklist filed to the writers&rsquo;, directors&rsquo; and actors&rsquo; guilds every Friday',
      'Minimum payments, signatory status, credit determinations and waivers',
      'Child performer work permits and education compliance, with real legal exposure']),
    ('Execution &amp; witnessing',[
      'Commissioned notary public',
      'Remote online notarization',
      'Loan signing agent for real estate closings'])]),
  diagram=DIAGRAMS['filings'], nobadge=True, screen=True))
DECK_STAKE=''.join(x[0] for x in SK); PANES+=''.join(x[1] for x in SK)

# ── Software & Tools: one tile per category ──
def mark(icon=None, mono=None, colour=False):
    if icon: return '<span class="tmark%s"><img src="%s" alt=""></span>'%(' colour' if colour else '', U(I+icon))
    return '<span class="tmark mono">%s</span>'%mono
def tool(m,name,tags_):
    return ('\n          <div class="tool">%s<div class="tinfo"><span class="tname">%s</span>'
            '<div class="tags">%s</div></div></div>')%(m,name,''.join('<span class="tag">%s</span>'%x for x in tags_))
def toolbody(ts): return '\n          <div class="tools">'+''.join(ts)+'\n          </div>'

K=[]
K.append(unit('wbd','tl-analysis','Analysis &amp; Modelling','Excel, SQL, Python, Tableau','4 platforms',
  toolbody([
    tool(mark('excel.svg',colour=True),'Microsoft Excel',['Power Query','Pivot tables','XLOOKUP / INDEX-MATCH','SUMIFS','Workflow trackers']),
    tool(mark(mono='SQL'),'SQL',['Queries','Joins','Aggregation']),
    tool(mark('python.svg'),'Python',['Scripting','Data wrangling']),
    tool(mark('tableau.svg'),'Tableau',['Dashboards','Data visualisation'])]),
  diagram=DIAGRAMS['analysis'], nobadge=True, screen=True))
K.append(unit('dbt','tl-enterprise','Enterprise Systems','SAP, Salesforce, Quickbase, PostgreSQL','4 platforms',
  toolbody([
    tool(mark('sap.svg'),'SAP',['Project Systems','Production cost extracts','Business Objects &mdash; BI layer']),
    tool(mark('salesforce.svg'),'Salesforce',['System of record','Programming reports']),
    tool(mark(mono='QB'),'Quickbase',['Account data']),
    tool(mark('postgresql.svg'),'PostgreSQL',['Relational data'])]),
  diagram=DIAGRAMS['enterprise'], nobadge=True, screen=True))
K.append(unit('lgd','tl-rights','Contract &amp; Rights','FilmTrack, Sylvester, Alliant, BLAST','4 platforms',
  toolbody([
    tool(mark(mono='FT'),'FilmTrack',['Rights management build']),
    tool(mark(mono='SY'),'Sylvester',['Participations reporting']),
    tool(mark(mono='AL'),'Alliant',['Rights &amp; royalties']),
    tool(mark(mono='BL'),'BLAST',['Deal administration'])]),
  diagram=DIAGRAMS['rights'], nobadge=True, screen=True))
K.append(unit('dtva','tl-workflow','Workflow &amp; Documents','Jira, Asana, SharePoint, Box and more','7 platforms',
  toolbody([
    tool(mark('jira.svg'),'Jira',['Ticket queue','Status reporting']),
    tool(mark('asana.svg'),'Asana',['Task coordination']),
    tool(mark('sharepoint.svg',colour=True),'SharePoint',['Working papers','Document control']),
    tool(mark('box.svg'),'Box',['Repositories']),
    tool(mark(mono='iM'),'iManage',['Legal document management']),
    tool(mark('adobeacrobatreader.svg'),'Adobe Acrobat Sign',['Execution']),
    tool(mark(mono='DS'),'DocuSign',['Execution'])]),
  diagram=DIAGRAMS['workflow'], nobadge=True, screen=True))
DECK_TOOLS=''.join(k[0] for k in K); PANES+=''.join(k[1] for k in K)

# ── Education & Certifications: one tile each ──
def credbody(lines):
    return '\n          <ul class="dl" style="margin-top:20px">'+''.join('<li>%s</li>'%x for x in lines)+'</ul>'
EDU={'lynn':U(L+'edu_lynn.png'), 'gsu':U(L+'edu_gsu.webp'),
     'ibm':U(L+'edu_ibm.webp'),   'tab':U(L+'edu_tab.webp')}
E=[]
E.append(unit('wbd','ed-mba','Master of Business Administration','Lynn University','2019',
  credbody(['Boca Raton, Florida','Graduate business administration, strategy and finance',
            'The grounding for reading a deal as a business decision, not just paperwork']),
  badge_img=EDU['lynn'], img=U(F+'ed_lynn.jpg'), shot=U(F+'bd_lynn.jpg'),
  logolink='https://www.lynn.edu/academics/colleges/business-and-management',
  logolabel='Lynn University College of Business and Management',
  verify='https://www.studentclearinghouse.org/verify/', vianame='National Student Clearinghouse'))
E.append(unit('dbt','ed-journalism','B.A., Journalism','Georgia State University','2017',
  credbody(['Atlanta, Georgia','Reporting, editing and writing for a general audience',
            'Where the habit of leading with the answer came from &mdash; the inverted pyramid runs through every deliverable on this site']),
  badge_img=EDU['gsu'], logofull=True, logodisc=True,
  logolink='https://www.gsu.edu/', logolabel='Georgia State University',
  img=U(F+'ed_gsu_j.jpg'), shot=U(F+'bd_gsu_j.jpg'),
  verify='https://www.studentclearinghouse.org/verify/', vianame='National Student Clearinghouse'))
E.append(unit('dtva','ed-film','B.A., Film &amp; Video','Georgia State University','2017',
  credbody(['Atlanta, Georgia','Production, post production and the structure of the industry',
            'A separate degree from the Journalism B.A. &mdash; and the reason the entertainment vocabulary was never foreign']),
  badge_img=EDU['gsu'], logofull=True, logodisc=True,
  logolink='https://cas.gsu.edu/', logolabel='Georgia State University College of Arts and Sciences',
  img=U(F+'ed_gsu_f.jpg'), shot=U(F+'bd_gsu_f.jpg'),
  verify='https://www.studentclearinghouse.org/verify/', vianame='National Student Clearinghouse'))
E.append(unit('lgd','ed-ibm','IBM Data Analyst','Professional Certificate','2026',
  credbody(['Python, SQL, Excel and data visualisation','Data cleaning, analysis and dashboard construction',
            'Completed alongside the Tableau certificate']),
  badge_img=EDU['ibm'], img=U(F+'ed_ibm.jpg'), shot=U(F+'bd_ibm.jpg'),
  logolink='https://www.ibm.com/us-en', logolabel='IBM',
  cert=U(F+'cert_ibm.jpg'), certlabel='IBM Data Analyst certificate',
  verify='https://coursera.org/verify/professional-cert/5T0BAGV9HHSP', vianame='Coursera'))
E.append(unit('tlv','ed-tableau','Tableau Business Intelligence Analyst','Professional Certificate','2026',
  credbody(['Dashboard design, calculated fields and data modelling',
            'Published visualisations and analytical storytelling',
            'The reporting layer on top of the SQL and Excel work']),
  badge_img=EDU['tab'], img=U(F+'ed_tab.jpg'), shot=U(F+'bd_tab.jpg'),
  logolink='https://www.tableau.com/', logolabel='Tableau',
  cert=U(F+'cert_tab.jpg'), certlabel='Tableau Business Intelligence Analyst certificate',
  verify='https://coursera.org/verify/professional-cert/XCAM49TGRDAC', vianame='Coursera'))
# three degrees on the first line, the two certificates centred on the second
BREAK='\n      <span class="deck-break" aria-hidden="true"></span>'
DECK_EDU=''.join(e[0] for e in E[:3]) + BREAK + ''.join(e[0] for e in E[3:])
PANES+=''.join(e[1] for e in E)

# ── Projects: three placeholders awaiting content ──
P=[]
for c, sid, title, sub in [
    ('wbd','pj-one',  'Project One',  'Title and summary to come'),
    ('lgd','pj-two',  'Project Two',  'Title and summary to come'),
    ('dbt','pj-three','Project Three','Title and summary to come')]:
    P.append(unit(c, sid, title, sub, 'Placeholder',
      credbody(['This tile is reserved for a project write-up.',
                'Replace the heading, the summary and this list with the work itself.',
                'Add a still, a short loop or a diagram to the tile face.']),
      badge_txt='PJ', phlabel='Content pending'))
DECK_PROJECTS=''.join(x[0] for x in P); PANES+=''.join(x[1] for x in P)

# -- the organisations the notice refers to; Turbo LV is his own and is not a third party --
REFS_ORGS=[(LG['wbd'],'Warner Bros. Discovery'), (LG['lgd'],'Legendary Entertainment'),
           (LG['dis'],'The Walt Disney Company'), (LG['dtva'],'Disney Television Animation'),
           (LG['cox'],'Cox Media Group'), (LG['coke'],'The Coca-Cola Company')]
# ── Resume: the pages are shown as images so nothing depends on a PDF plugin,
# and the file itself rides along in the page as plain base64 so the download
# never has to fetch anything from a path.
import base64 as _b64
RESUME_B64 = _b64.b64encode(open('docs/resume.pdf','rb').read()).decode()
RESUME_PAGES = ''.join(
    '\n        <img class="cvpage" src="%s" alt="Resume, page %d of 2">'
    % (U('docs/resume_page%d.jpg' % n), n) for n in (1, 2))

REFS=('\n      <div class="refs">'
      '\n        <div class="refs-k">Organizations referenced</div>'
      '\n        <ul class="refs-l">')
for src,nm in REFS_ORGS:
    REFS+='\n          <li><img src="%s" alt=""><b>%s</b></li>'%(src,nm)
REFS+='\n        </ul>\n      </div>'

for name,val in [('deck_work.html',DECK_WORK),('deck_builds.html',DECK_BUILDS),('deck_stake.html',DECK_STAKE),
                 ('deck_tools.html',DECK_TOOLS),('deck_edu.html',DECK_EDU),('deck_proj.html',DECK_PROJECTS),
                 ('panes.html',PANES),('refs.html',REFS),
                 ('resume.txt',RESUME_B64),('resume_pages.html',RESUME_PAGES)]:
    io.open(name,'w',encoding='utf-8').write(val)
    print("  %-18s %8d B"%(name,os.path.getsize(name)))
print("tiles: work %d | builds %d | tools %d | edu %d | projects %d"%(len(T),len(B),len(K),len(E),len(P)))

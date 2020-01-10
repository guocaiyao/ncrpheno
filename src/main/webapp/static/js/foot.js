/*
 * #%L
 * jdispatcher-resources
 * %%
 * Copyright (C) 2007 - 2017 EMBL - European Bioinformatics Institute
 * %%
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * #L%
 */
(function updateFoot() {
    var html = ''
        + '<div class="grid_4 alpha"> '
        //+ '<h3 class="embl-ebi"><a href="lilab.sysu.edu.cn:8080" title="SYSU">About US</a></h3>'
        //+ ' <a href="http://www.sysu.edu.cn/2012/cn/index.htm" title="SYSU"><img src="/Tools/common/themes/frontier/logo.jpg" alt="SYSU 涓㥣北澶у崘"></a> '
        // + ' <ul> '
        // + ' <li class="first"><a href="//www.ebi.ac.uk/about/news">News</a></li> '
        // + ' <li><a href="//www.ebi.ac.uk/about/our-impact">Our impact</a></li> '
        // + ' <li><a href="//www.ebi.ac.uk/about/contact">Contact us</a> '
        // + ' <li class="last"><a href="http://intranet.ebi.ac.uk">Intranet</a></li> '
        // + ' </ul> '
        // + ' </div> '
        // + ' '
        // + ' <div class="grid_4"> '
        // + ' <h3 class="services"><a href="//www.ebi.ac.uk/services">Services</a></h3> '
        // + ' <ul> '
        // + ' <li class="first"><a href="//www.ebi.ac.uk/services">By topic</a></li> '
        // + ' <li><a href="//www.ebi.ac.uk/services/all">By name (A-Z)</a></li> '
        // + ' <li class="last"><a href="//www.ebi.ac.uk/support">Help &amp; Support</a></li> '
        // + ' </ul> '
        // + ' </div> '
        // + ' '
        // + ' <div class="grid_4"> '
        // + ' <h3 class="research"><a href="//www.ebi.ac.uk/research">Research</a></h3> '
        // + ' <ul> '
        // + ' <li class="first"><a href="//www.ebi.ac.uk/research">Overview</a></li> '
        // + ' <li><a href="//www.ebi.ac.uk/research/publications">Publications</a></li> '
        // + ' <li><a href="//www.ebi.ac.uk/research/groups">Research groups</a></li> '
        // + ' <li class="last"><a href="//www.ebi.ac.uk/research/postdocs">Postdocs</a> &amp; <a href="//www.ebi.ac.uk/research/eipp">PhDs</a></li> '
        // + ' </ul> '
        // + ' </div> '
        // + ' '
        // + ' <div class="grid_4"> '
        // + ' <h3 class="training"><a href="//www.ebi.ac.uk/training">Training</a></h3> '
        // + ' <ul> '
        // + ' <li class="first"><a href="//www.ebi.ac.uk/training">Overview</a></li> '
        // + ' <li><a href="//www.ebi.ac.uk/training/handson">Train at EBI</a></li> '
        // + ' <li><a href="//www.ebi.ac.uk/training/roadshow">Train outside EBI</a></li> '
        // + ' <li><a href="//www.ebi.ac.uk/training/online">Train online</a></li> '
        // + ' <li class="last"><a href="//www.ebi.ac.uk/training/contact-us">Contact organisers</a></li> '
        // + ' </ul> '
        + ' </div> ' + ' '
        // + ' <div class="grid_4"> '
        // + ' <h3 class="industry"><a href="//www.ebi.ac.uk/industry">Industry</a></h3> '
        // + ' <ul> '
        // + ' <li class="first"><a href="//www.ebi.ac.uk/industry">Overview</a></li> '
        // + ' <li><a href="//www.ebi.ac.uk/industry/private">Members Area</a></li> '
        // + ' <li><a href="//www.ebi.ac.uk/industry/workshops">Workshops</a></li> '
        // + ' <li><a href="//www.ebi.ac.uk/industry/sme-forum"><abbr title="Small Medium Enterprise">SME</abbr> Forum</a></li> '
        // + ' <li class="last"><a href="//www.ebi.ac.uk/industry/contact">Contact Industry programme</a></li> '
        // + ' </ul> '
        // + ' </div> '
        // + ' '
        // + ' <div class="grid_4 omega"> '
        // + ' <h3 class="about"><a href="//www.ebi.ac.uk/about">About us</a></h3> '
        // + ' <ul> '
        // + ' <li class="first"><a href="//www.ebi.ac.uk/about">Overview</a></li> '
        // + ' <li><a href="//www.ebi.ac.uk/about/leadership">Leadership</a></li> '
        // + ' <li><a href="//www.ebi.ac.uk/about/funding">Funding</a></li> '
        // + ' <li><a href="//www.ebi.ac.uk/about/background">Background</a></li> '
        // + ' <li><a href="//www.ebi.ac.uk/about/partnerships">Collaboration</a></li> '
        // + ' <li><a href="//www.ebi.ac.uk/about/jobs" title="Jobs, postdocs, PhDs...">Jobs</a></li> '
        // + ' <li><a href="//www.ebi.ac.uk/about/people">People &amp; groups</a></li> '
        // + ' <li><a href="//www.ebi.ac.uk/about/news">News</a></li> '
        // + ' <li><a href="//www.ebi.ac.uk/about/events">Events</a></li> '
        // + ' <li><a href="//www.ebi.ac.uk/about/travel">Visit us</a></li> '
        // + ' <li class="last"><a href="//www.ebi.ac.uk/about/contact">Contact us</a></li> '
        // + ' </ul> '
        // + ' </div>'
        + '';


    function init() {
        try {
            var foot = document.getElementById('global-nav-expanded');
            foot.innerHTML = html;
        } catch (err) {
            setTimeout(init, 500);
        }
    }
    init();
})();

(function includeScripts() {
    var requireScripts = [
        /*
   '//www.ebi.ac.uk/web_guidelines/js/cookiebanner.js',
   '//www.ebi.ac.uk/web_guidelines/js/foot.js',
   '//www.ebi.ac.uk/web_guidelines/js/script.js',
   */
        '/Tools/common/themes/frontier/js/foot.js',
        '/Tools/common/themes/frontier/js/script.js',
        '//www.ebi.ac.uk/web_guidelines/js/responsify.js',
        '//www.ebi.ac.uk/web_guidelines/js/downtime.js?' + Math.round(new Date().getTime() / 3600000)
    ];

    function init() {
        try {
            var existingScripts = document.getElementsByTagName('script');
            var gotScript, i, j, putScript;
            for (j = 0; j < requireScripts.length; j++) {
                for (gotScript = false, i = 0; i < existingScripts.length; i++)
                    if (existingScripts[i].src.indexOf(requireScripts[j]) !== -1) gotScript = true;
                if (!gotScript) {
                    putComment = document.createComment(requireScripts[j] + ' automatically inserted');
                    putScript = document.createElement('script');
                    putScript.type = 'text/javascript';
                    putScript.src = requireScripts[j];
                    document.body.appendChild(putComment);
                    document.body.appendChild(putScript);
                }
            }
        } catch (err) {
            setTimeout(init, 500);
        }
    }
    init();
})();
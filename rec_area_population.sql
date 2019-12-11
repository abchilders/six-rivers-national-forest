prompt ===
prompt Populating the Rec_Area table. 
prompt === 

-- To escape ampersands in data:
set define off 

-- Template for insertion: 

--insert into Rec_Area(fid, internal_id, recareanam, longitude, latitude, recareaurl, 
--     feedescrip, open_season_start, operational_hours, open_season_end, forestname, 
--     reservation_info, markertype, markeractivity, markeractivitygroup, 
--     recareadescription, restrictions, recareaid, recportal_unit_key, forestorgcode,
--     infra_cn, spotlightdisplay, attractiondisplay, accessibility, openstatus)
--values
--();

insert into Rec_Area(fid, internal_id, recareanam, longitude, latitude, recareaurl,
       forestname,
       markertype, markeractivity, markeractivitygroup,
       recareadescription, recareaid, recportal_unit_key, forestorgcode,
       spotlightdisplay, attractiondisplay, openstatus)
values
(2229, 3, 'Smith River National Recreation Area', -123.896942, 41.778856, 
       'https://www.fs.usda.gov/recarea/srnf/recarea/?recid=11440', 
       'Six Rivers National Forest', '/Internet/FSE_MEDIA/fsbdev2_016717.png', 
       'Intermediate Parent Group', 'Intermediate Parent Group',
       '<p>Recreational activities abound in the Smith River NRA. The beautiful Smith River offers fishing for steelhead, trout, and salmon. During the summer months, the pure, clean waters of the Smith River are perfect for swimming, rafting, or fishing.', 11440, 11438, 
       510, 'N', 'N', 'none');


insert into Rec_Area(fid, internal_id, recareanam, longitude, latitude, recareaurl,
       feedescrip, open_season_start, operational_hours, open_season_end, forestname,
       reservation_info, markertype, markeractivity, markeractivitygroup,
       recareadescription, recareaid, recportal_unit_key, forestorgcode,
       infra_cn, spotlightdisplay, attractiondisplay, openstatus)
values
(2230, 4, 'Big Flat Campground', -123.912778, 41.68645, 
       'https://www.fs.usda.gov/recarea/srnf/recarea/?recid=11442', 
       '$8 per vehicle, $5 per extra vehicle', '20-May-19', 
       'Open summer only, 24 hours per day, 7 days per week.', '15-Sep-19', 
       'Six Rivers National Forest', 'Sites in this campground cannot be reserved.', 
       '/Internet/FSE_MEDIA/fsbdev2_016657.png', 'Campground Camping', 'Camping \& Cabins', 
       '<p>Big Flat Campground is a small, quiet campground bordered by Hurdygurdy Creek. Since it is far from towns and highways, it''s the perfect place to "get away from it all." The campground is semi-open; trees shade some sites.', 
       11442, 11438, 510, 5030.004041, 'N', 'N', 'closed'); 


insert into Rec_Area(fid, internal_id, recareanam, longitude, latitude, recareaurl,
       feedescrip, open_season_start, open_season_end, forestname,
       reservation_info, markertype, markeractivity, markeractivitygroup,
       recareadescription, recareaid, recportal_unit_key, forestorgcode,
       infra_cn, spotlightdisplay, attractiondisplay, openstatus)
values
(2231, 5, 'Grassy Flat Campground', -123.889132, 41.855992, 
       'https://www.fs.usda.gov/recarea/srnf/recarea/?recid=11443', 
       '$10.00 per campsite; this includes one vehicle. There is a $5.00 charge for a second vehicle (maximum of two vehicles per site).', 
       '20-May-19', '15-Sep-19', 'Six Rivers National Forest', 
       'Reservations&nbsp;can be made at <a href="http://www.recreation.gov">www.recreation.gov</a> or by calling 877-444-6777. Reservations available for the following dates: May&nbsp;20 to September 15, 2019.', 
       '/Internet/FSE_MEDIA/fsbdev2_016657.png', 
       'Campground Camping', 'Camping & Cabins', 
       '<p>Grassy Flat Campground is adjacent to the Middle Fork of the Smith River. Highway 199 borders the north side. True to its name, it is flat but not grassy. Trees shade the campground and shrubs fill in the area between sites.</p>', 
       11443, 11438, 510, 5031.004041, 'N', 'N', 'closed'); 

       
insert into Rec_Area(fid, internal_id, recareanam, longitude, latitude, recareaurl,
       feedescrip, open_season_start, operational_hours, forestname,
       reservation_info, markertype, markeractivity, markeractivitygroup,
       recareadescription, recareaid, recportal_unit_key, forestorgcode,
       infra_cn, spotlightdisplay, attractiondisplay, openstatus)
values
(2232, 6, 'North Fork Campground', -123.960714, 41.979064, 
       'https://www.fs.usda.gov/recarea/srnf/recarea/?recid=11444', 
       '$8.00, $5.00 Extra Vehicle Charge', 'All Year', 
       '24 hours per day, 7 days per week, year-round', 'Six Rivers National Forest', 
       'No reservations available. Self-register at the entrance on a first-come, first-served basis.', 
       '/Internet/FSE_MEDIA/fsbdev2_016657.png', 'Campground Camping', 'Camping & Cabins', 
       '<p>North Fork Campground is a quiet, semi-shaded, remote campground bordered by the North Fork of the Smith River. This is a perfect place to &ldquo;get away from it all&rdquo; and to stay before rafting the Wild North Fork.', 
       11444, 11438, 510, 15026009231, 'N', 'N', 'open'); 


insert into Rec_Area(fid, internal_id, recareanam, longitude, latitude, recareaurl,
       feedescrip, open_season_start, operational_hours, forestname,
       reservation_info, markertype, markeractivity, markeractivitygroup,
       recareadescription, recareaid, recportal_unit_key, forestorgcode,
       infra_cn, spotlightdisplay, attractiondisplay, openstatus)
values
(2233, 7, 'Panther Flat Campground', -123.930159, 41.842438, 
       'https://www.fs.usda.gov/recarea/srnf/recarea/?recid=11445', 
       'Family campsites accommodate up to eight people per site, with a maximum of two vehicles. The&nbsp;fee&nbsp;is $15.00 per&nbsp;site&nbsp;per&nbsp;night. This fee&nbsp;includes one vehicle;&nbsp;a $5.00 fee is charged for the second vehicle.', 
       'All Year', '24 hours/day, 7 days/week, year-round.', 'Six Rivers National Forest', 
       'Reservations are not required, but recommended in summer, especially on weekends and holidays. To&nbsp;reserve contact Recreation.gov at 877-444-6777 or online at <a href="http://www.recreation.gov/">www.recreation.gov/</a>.',
       '/Internet/FSE_MEDIA/fsbdev2_016657.png', 'Campground Camping', 'Camping & Cabins', 
       '<p>Panther Flat is the largest and most popular campground in the Smith River NRA. It is located on a flat about 50 feet above the Middle Fork of Smith River. Highway 199 borders the south side.', 
       11445, 11438, 510, 5032.004041, 'N', 'N', 'open'); 


insert into Rec_Area(fid, internal_id, recareanam, longitude, latitude, recareaurl,
       feedescrip, open_season_start, open_season_end, forestname,
       reservation_info, markertype, markeractivity, markeractivitygroup,
       recareadescription, recareaid, recportal_unit_key, forestorgcode,
       infra_cn, spotlightdisplay, attractiondisplay, openstatus)
values
(2234, 8, 'Patrick Creek Campground', -123.845873, 41.872995, 
       'https://www.fs.usda.gov/recarea/srnf/recarea/?recid=11446', 
       '$14, $5 Extra Vehicle Charge.', '20-May-19', '15-Sep-19', 
       'Six Rivers National Forest', 
       'Reservations&nbsp;can be made at <a href="http://www.recreation.gov">http://www.recreation.gov</a> or by calling or by calling 877-444-6777. Reservations available for the following dates: May 20 to September 15, 2019.', 
       '/Internet/FSE_MEDIA/fsbdev2_016657.png', 'Campground Camping', 'Camping & Cabins', 
       '<p>Patrick Creek Campground and adjacent day use area have special charm, with rock walls, steps, and restrooms, and sunken campfire circle built in the 1930s by the Civilian Conservation Corps.', 
       11446, 11438, 510, 5033.004041, 'N', 'N', 'closed'); 


insert into Rec_Area(fid, internal_id, recareanam, longitude, latitude, recareaurl,
       feedescrip, open_season_start, operational_hours, open_season_end, forestname,
       reservation_info, markertype, markeractivity, markeractivitygroup,
       recareadescription, restrictions, recareaid, recportal_unit_key, forestorgcode,
       infra_cn, spotlightdisplay, attractiondisplay, openstatus)
values
(2235, 9, 'Bear Basin Butte Lookout / Pierson Cabin', -123.742189, 41.809051, 
       'https://www.fs.usda.gov/recarea/srnf/recarea/?recid=11447', 
       '<span lang="EN">$75 per night. Rate is&nbsp;for 1 to 8 persons; there is a fee of $5 per&nbsp;night&nbsp;for each additional person over 8, paid directly to the facility (usually when picking up the key). The maximum occupancy&nbsp;</span>is 12 persons.', 
       '1-Jul-19', 
       '<span lang=""EN"">The cabin and lookout are rented as a pair from July&nbsp;1&nbsp;to September 30.</span>', 
       '30-Sep-19', 'Six Rivers National Forest', 
       '<span lang="EN">Reserve through <a href="http://www.recreation.gov/welcome.do">Recreation.gov</a>, 1-877-444-6777; TDD:1-877-833-6777;&nbsp;International: 1-518-885-3639.&nbsp;Reservations must be made at least three days in advance and up to six months.',
       '/Internet/FSE_MEDIA/fsbdev2_016580.png', 'Cabin Rentals', 'Camping & Cabins', 
       '<p>Are you seeking solitude, awe-inspiring views, a quiet haven away from crowds, or perhaps you&#39;ve wondered what life would be like for a fire spotter in the Forest Service?', 
       'Pets are not allowed in the cabin or lookout.', 11447, 11438, 510, 6218.004041, 
       'N', 'N', 'closed'); 


insert into Rec_Area(fid, internal_id, recareanam, longitude, latitude, recareaurl,
       forestname,
       markertype, markeractivity, markeractivitygroup,
       recareadescription, recareaid, recportal_unit_key, forestorgcode,
       spotlightdisplay, attractiondisplay, openstatus)
values
(2236, 10, 'Elk Camp Ridge (#2E04)', -123.898762, 41.887439, 
       'https://www.fs.usda.gov/recarea/srnf/recarea/?recid=11454', 
       'Six Rivers National Forest', '/Internet/FSE_MEDIA/fsbdev2_016773.png', 
       'Backpacking', 'Hiking', 
       '<p>Originally a pack train trail between Crescent City, CA and the gold mines of the Illinois Valley in Oregon, this scenic trail presents panoramic views of high mountain peaks, the Pacific Ocean, and the North and Middle Forks of the Smith River.', 
       11454, 11438, 510, 'N', 'N', 'open'); 


insert into Rec_Area(fid, internal_id, recareanam, longitude, latitude, recareaurl,
       forestname,
       markertype, markeractivity, markeractivitygroup,
       recareadescription, recareaid, recportal_unit_key, forestorgcode,
       spotlightdisplay, attractiondisplay, openstatus)
values
(2237, 11, 'Dry Lake', -123.875775, 41.741837, 
       'https://www.fs.usda.gov/recarea/srnf/recarea/?recid=11471', 
       'Six Rivers National Forest', '/Internet/FSE_MEDIA/fsbdev2_016881.png', 
       'Lake and Pond Fishing', 'Fishing', 
       '<p>Dry Lake, encompassing 3.25 acres, lies in a quiet setting of willow, alder, oaks, firs, and myrtles (bay). The lake is currently stocked with rainbow trout. Maximum depth is nine feet. Dry lake is located off of County Road 405.</p>', 
       11471, 11438, 510, 'N', 'N', 'open');


insert into Rec_Area(fid, internal_id, recareanam, longitude, latitude, recareaurl,
       forestname,
       markertype, markeractivity, markeractivitygroup,
       recareadescription, recareaid, recportal_unit_key, forestorgcode,
       spotlightdisplay, attractiondisplay, openstatus)
values
(2243, 12, 'Ukonom Ranger District', -123.410797, 41.482588, 
       'https://www.fs.usda.gov/recarea/srnf/recarea/?recid=25814', 
       'Six Rivers National Forest', '/Internet/FSE_MEDIA/fsbdev2_016717.png', 
       'Intermediate Parent Group', 'Intermediate Parent Group', 
       '<p>The Ukonom Ranger District, while within the geographic boundary of the Klamath National Forest, has been administered by the Six Rivers National Forest since September 1999.', 
       25814, 11438, 510, 'N', 'N', 'none');  


insert into Rec_Area(fid, internal_id, recareanam, longitude, latitude, recareaurl,
       feedescrip, open_season_start, open_season_end, forestname,
       reservation_info, markertype, markeractivity, markeractivitygroup,
       recareadescription, recareaid, recportal_unit_key, forestorgcode,
       spotlightdisplay, attractiondisplay, openstatus)
values
(2244, 13, 'Nordheimer Group Campground', -123.360758, 41.297524, 
       'https://www.fs.usda.gov/recarea/srnf/recarea/?recid=25817',
       '$8 family sites per vehicle.&nbsp;An additional $5 fee is charged for a second vehicle. Day Use - $5 fee',
       '1-Apr-19', '30-Sep-19', 'Six Rivers National Forest', 
       '&nbsp;Reservations only. Reservations may be made by calling (877) 444-6777 or visiting <a href="http://www.recreation.gov">www.recreation.gov</a>. Reservations available for the following dates:&nbsp;April 1&nbsp;to September 30, 2019.', 
       '/Internet/FSE_MEDIA/fsbdev2_016657.png', 'Campground Camping', 'Camping & Cabins', 
       '<p>Nordheimer is in the heart of the Salmon River whitewater area. Rafting activities begin in the spring and continue until the water levels drop in early summer.', 
       25817, 11438, 510, 'N', 'N', 'open'); 


insert into Rec_Area(fid, internal_id, recareanam, longitude, latitude, recareaurl,
       forestname,
       markertype, markeractivity, markeractivitygroup,
       recareadescription, recareaid, recportal_unit_key, forestorgcode,
       spotlightdisplay, attractiondisplay, openstatus)
values
(2245, 14, 'Oak Bottom River Access', -123.115809, 41.809461, 
       'https://www.fs.usda.gov/recarea/srnf/recarea/?recid=25818', 
       'Six Rivers National Forest', '/Internet/FSE_MEDIA/fsbdev2_016517.png', 
       'Beachcombing', 'Beaches & Dunes', 
       '<p>The Oak Bottom River Access, located directly across from the campground, provides access to the Salmon River which is renowned for it&#39;s class 3-5 whitewater. The lower portion of the Salmon offers excellent swimming and tubing opportunities.', 
       25818, 11438, 510, 'N', 'N', 'open'); 


insert into Rec_Area(fid, internal_id, recareanam, longitude, latitude, recareaurl,
       feedescrip, open_season_start, open_season_end, forestname,
       recareadescription, restrictions, recareaid, recportal_unit_key, forestorgcode,
       spotlightdisplay, attractiondisplay, openstatus)
values
(2246, 15, 'Nordheimer River Access', -123.361875, 41.299171, 
       'https://www.fs.usda.gov/recarea/srnf/recarea/?recid=75350', 
       'No fee for river access. Campground and group camps require fee.', 'January',
       'December', 'Six Rivers National Forest', 
       '<p>This access is located just outside of the Nordheimer Campground. To access the river, drive through the campground and down to the river. Excellent spot for rafting, fishing or swimming.</p>', 
       'No overnight camping is allowed at this river access.', 75350, 11438, 510, 'N', 'N',
       'open');

insert into Rec_Area(fid, internal_id, recareanam, longitude, latitude, recareaurl,
       forestname,
       markertype, markeractivity, markeractivitygroup,
       recareadescription, recareaid, recportal_unit_key, forestorgcode,
       spotlightdisplay, attractiondisplay, openstatus)
values
(2253, 16, 'Island Lake', -123.69632, 41.760119, 
       'https://www.fs.usda.gov/recarea/srnf/recarea/?recid=11472', 
       'Six Rivers National Forest', '/Internet/FSE_MEDIA/fsbdev2_016519.png', 
       'Lake and Pond Fishing', 'Fishing', 
       '<p>Island Lake encompasses 4 acres. Exposed granite, willows and alders contribute to the tranquil scenery.&nbsp; The lake is currently stocked with rainbow trout.</p>',
       11472, 11438, 510, 'N', 'N', 'open'); 

insert into Rec_Area(fid, internal_id, recareanam, longitude, latitude, recareaurl,
       forestname,
       markertype, markeractivity, markeractivitygroup,
       recareadescription, recareaid, recportal_unit_key, forestorgcode,
       spotlightdisplay, attractiondisplay, openstatus)
values
(2254, 17, 'Muslatt Lake', -123.699869, 41.731738, 
       'https://www.fs.usda.gov/recarea/srnf/recarea/?recid=11473', 
       'Six Rivers National Forest', '/Internet/FSE_MEDIA/fsbdev2_016881.png', 
       'Lake and Pond Fishing', 'Fishing', 
       '<p>Surrounded by oaks and firs, Muslatt Lake only encompasses a little over 1 acre.</p>', 
       11473, 11438, 510, 'N', 'N', 'open');


insert into Rec_Area(fid, internal_id, recareanam, longitude, latitude, recareaurl,
       forestname,
       markertype, markeractivity, markeractivitygroup,
       recareadescription, recareaid, recportal_unit_key, forestorgcode,
       spotlightdisplay, attractiondisplay, openstatus)
values
(2255, 18, 'Sanger Lake', -123.648973, 41.901658, 
       'https://www.fs.usda.gov/recarea/srnf/recarea/?recid=11474', 
       'Six Rivers National Forest', '/Internet/FSE_MEDIA/fsbdev2_016881.png', 
       'Lake and Pond Fishing', 'Fishing', 
       '<p>Sanger Lake, formed by glacial scour, encompasses 6 acres and is currently stocked with brook trout.</p><p>Sanger is&nbsp;stocked annually in July with fingerling trout, between 500 and 1000 fish each year.</p>', 
       11474, 11438, 510, 'N', 'N', 'open');

 
insert into Rec_Area(fid, internal_id, recareanam, longitude, latitude, recareaurl,
       operational_hours, forestname,
       markertype, markeractivity, markeractivitygroup,
       recareadescription, restrictions, recareaid, recportal_unit_key, forestorgcode,
       spotlightdisplay, attractiondisplay, openstatus)
values
(2256, 19, 'Siskiyou Wilderness', -123.699869, 41.731738, 
       'https://www.fs.usda.gov/recarea/srnf/recarea/?recid=11476', 
       'Access into the Siskiyou Wilderness may be difficult due to snow in the high country.', 
       'Six Rivers National Forest', '/Internet/FSE_MEDIA/fsbdev2_016773.png', 
       'Backpacking', 'Hiking', 
       '<p>The forested mountains, valleys and meadows of the Siskiyou Wilderness in Del Norte, Humboldt and Siskiyou counties of northwestern California offer vistas of incredible beauty, diverse scenery and limitless opportunities for solitude.</p>',
       'Remember, travel in wilderness areas is restricted to foot or horseback. No motorized or mechanical equipment (e.g. chainsaws, bicycles) is allowed.', 
       11476, 11438, 510, 'N', 'Y', 'open'); 


insert into Rec_Area(fid, internal_id, recareanam, longitude, latitude, recareaurl,
       forestname,
       markertype, markeractivity, markeractivitygroup,
       recareadescription, recareaid, recportal_unit_key, forestorgcode,
       infra_cn, spotlightdisplay, attractiondisplay, openstatus)
values
(2257, 20, 'Lower Trinity Ranger District', -123.651123, 40.918892, 
       'https://www.fs.usda.gov/recarea/srnf/recarea/?recid=11477', 
       'Six Rivers National Forest', '/Internet/FSE_MEDIA/fsbdev2_016717.png', 
       'Intermediate Parent Group', 'Intermediate Parent Group', 
       '<p>The Lower Trinity Ranger District is bisected by State Highway 299, the main travel route in Northwestern California to reach the Northcoast. Willow Creek is Approximately 100 miles west of Redding and 45 miles east of Eureka/Arcata.', 
       11477, 11438, 510, 5016.004041, 'N', 'N', 'none');

 
insert into Rec_Area(fid, internal_id, recareanam, longitude, latitude, recareaurl,
       forestname,
       recareadescription, restrictions, recareaid, recportal_unit_key, forestorgcode,
       spotlightdisplay, attractiondisplay, openstatus)
values
(2258, 21, 'Big Bar River Access', -123.631944, 40.946944, 
       'https://www.fs.usda.gov/recarea/srnf/recarea/?recid=79264', 
       'Six Rivers National Forest', 
       '<p>Located approx. 8 miles downstream from Orleans, Big Bar offers a gravel dirt road to an excellent boat launch for drift and jet boats. There is an information kiosk, ample parking and excellent access to the river&rsquo;s edge for fishing.</p>',
       'No camping allowed at this river access.<br />Dogs on leash only.', 
       79264, 11438, 510, 'N', 'N', 'open'); 


insert into Rec_Area(fid, internal_id, recareanam, longitude, latitude, recareaurl,
       forestname,
       recareadescription, restrictions, recareaid, recportal_unit_key, forestorgcode,
       spotlightdisplay, attractiondisplay, openstatus)
values
(2259, 22, 'Brannons Bar River Access', -123.25342, 41.22557, 
       'https://www.fs.usda.gov/recarea/srnf/recarea/?recid=79294', 
       'Six Rivers National Forest', 
       '<p>This access consists of a gravel road down to the Salmon River. A very popular take-out for the Butler and Nordheimer runs and is a popular spot for summertime swimming.</p>',
       'No camping allowed at the river access', 79294, 11438, 510, 'N', 'N', 'open');


insert into Rec_Area(fid, internal_id, recareanam, longitude, latitude, recareaurl,
       forestname,
       markertype, markeractivity, markeractivitygroup,
       recareadescription, recareaid, recportal_unit_key, forestorgcode,
       spotlightdisplay, attractiondisplay, openstatus)
values
(2260, 23, 'George Geary River Access', -123.462392, 41.379355, 
       'https://www.fs.usda.gov/recarea/srnf/recarea/?recid=59665', 
       'Six Rivers National Forest', '/Internet/FSE_MEDIA/fsbdev2_016517.png', 
       'Beachcombing', 'Beaches & Dunes', 
       '<p>This access to the Salmon River is designated Day Use Only, no overnight camping. It has a graded gravel ramp to a cobble bar for parking. Boats must be carried a short distance to the water. There is limited parking and some shade. </p>', 
       59665, 11438, 510, 'N', 'N', 'none'); 


insert into Rec_Area(fid, internal_id, recareanam, longitude, latitude, recareaurl,
       forestname,
       markertype, markeractivity, markeractivitygroup,
       recareadescription, recareaid, recportal_unit_key, forestorgcode,
       spotlightdisplay, attractiondisplay, openstatus)
values
(2261, 24, 'Big Rock Day Use Area & River Access', -123.629065, 40.943844, 
       'https://www.fs.usda.gov/recarea/srnf/recarea/?recid=64828', 
       'Six Rivers National Forest', '/Internet/FSE_MEDIA/fsbdev2_016610.png', 'Picnicking',
       'Picnicking', 
       '<p>Located approximately 1/4 mile on Highway 96 from the Highway 299 intersection in the town of Willow Creek, Big Rock offers day use for those who want to&nbsp;spend the day&nbsp;on the Trinity River.</p>',
       64828, 11438, 510, 'N', 'N', 'none'); 


insert into Rec_Area(fid, internal_id, recareanam, longitude, latitude, recareaurl,
       feedescrip, open_season_start, open_season_end, forestname,
       reservation_info, markertype, markeractivity, markeractivitygroup,
       recareadescription, recareaid, recportal_unit_key, forestorgcode,
       infra_cn, spotlightdisplay, attractiondisplay, openstatus)
values
(2269, 25, 'Boise Creek Campground', -123.656316, 40.944959, 
       'https://www.fs.usda.gov/recarea/srnf/recarea/?recid=11479', 
       '$10 camping fee - $5 for extra vehicle, $5 day-use fee for day use of campsites.', 
       '18-May-19', '30-Sep-19', 'Six Rivers National Forest', 
       'Sites 1-6&nbsp;and&nbsp;17 are subject to reservation.&nbsp;Please reserve the&nbsp;<a href=""http://www.recreation.gov/camping/Boise_Creek/r/campgroundDetails.do?contractCode=NRSO&amp;parkId=72028&amp;topTabIndex=Search"">campsite at Recreation.gov</a>.', 
       '/Internet/FSE_MEDIA/fsbdev2_016579.png', 'Campground Camping', 'Camping & Cabins',
       '<p>Boise Creek Campground is located in a lovely forest setting that includes large Pacific madrone, Douglas-fir, and California bay trees. </p>', 
       11479, 11438, 510, 5040.004041, 'N', 'N', 'open');


insert into Rec_Area(fid, internal_id, recareanam, longitude, latitude, recareaurl,
       feedescrip, open_season_start, operational_hours, open_season_end, forestname,
       reservation_info, markertype, markeractivity, markeractivitygroup,
       recareadescription, recareaid, recportal_unit_key, forestorgcode,
       infra_cn, spotlightdisplay, attractiondisplay, openstatus)
values
(2270, 26, 'East Fork Campground', -123.706055, 40.90465, 
       'https://www.fs.usda.gov/recarea/srnf/recarea/?recid=11480', 
       '$8 camping fee - $5 for extra vehicle,&nbsp;$4 day-use fee in campground area', 
       '15-Jun-19', 
       'Dates may vary due to wet weather and POC root disease: call 530-629-2118',
       '30-Sep-19', 'Six Rivers National Forest', '&nbsp;No reservations.', 
       '/Internet/FSE_MEDIA/fsbdev2_016579.png', 'Campground Camping', 'Camping & Cabins',
       '<p>Trailer space available.</p>', 11480, 11438, 510, 5287.004041, 'N', 'N', 'open');


insert into Rec_Area(fid, internal_id, recareanam, longitude, latitude, recareaurl,
       forestname,
       markertype, markeractivity, markeractivitygroup,
       recareadescription, recareaid, recportal_unit_key, forestorgcode,
       spotlightdisplay, attractiondisplay, openstatus)
values
(2271, 27, 'Trinity River', -123.613272, 40.920435, 
       'https://www.fs.usda.gov/recarea/srnf/recarea/?recid=11519', 
       'Six Rivers National Forest', '/Internet/FSE_MEDIA/fsbdev2_016830.png', 
       'Boating - Non-Motorized', 'Water Activities',
       '<p>The Trinity River&#39;s headwaters begin in the rugged Trinity Alps, making it&#39;s way through the wilderness, settling into deep valleys, transitioning to spacious glides and inviting beaches until finally meeting up with the mighty Klamath River.</p>', 
       11519, 11438, 510, 'N', 'N', 'none'); 


insert into Rec_Area(fid, internal_id, recareanam, longitude, latitude, recareaurl,
       forestname,
       markertype, markeractivity, markeractivitygroup,
       recareadescription, recareaid, recportal_unit_key, forestorgcode,
       infra_cn, spotlightdisplay, attractiondisplay, openstatus)
values
(2272, 28, 'Mad River Ranger District', -123.184204, 40.177544, 
       'https://www.fs.usda.gov/recarea/srnf/recarea/?recid=11520', 
       'Six Rivers National Forest', '/Internet/FSE_MEDIA/fsbdev2_016717.png', 
       'Intermediate Parent Group', 'Intermediate Parent Group', 
       '<p>The Mad River Ranger District is located on Highway 36 approximately 50 miles east of Highway 101 and the Eureka/Arcata area and 100 miles west of Interstate 5 and the cities of Redding and Red Bluff.', 
       11520, 11438, 510, 5022.004041, 'N', 'N', 'none'); 


insert into Rec_Area(fid, internal_id, recareanam, longitude, latitude, recareaurl,
       forestname,
       markertype, markeractivity, markeractivitygroup,
       recareadescription, recareaid, recportal_unit_key, forestorgcode,
       infra_cn, spotlightdisplay, attractiondisplay, openstatus)
values
(2273, 29, 'Dolan''s Bar River Access', -123.31586, 41.18976, 
       'https://www.fs.usda.gov/recarea/srnf/recarea/?recid=64830', 
       'Six Rivers National Forest', '/Internet/FSE_MEDIA/fsbdev2_016517.png',
       'Beachcombing', 'Beaches & Dunes', 
       '<p>Located approximately one and a half miles upriver from Orleans, this site offers river access for motorized and non-motorized boaters and anglers. From highway 96, river access is only 3/4 of a mile away, down a gravel dirt road accessible by car.', 
       64830, 11438, 510, 510, 'N', 'N', 'open'); 


insert into Rec_Area(fid, internal_id, recareanam, longitude, latitude, recareaurl,
       forestname,
       markertype, markeractivity, markeractivitygroup,
       recareadescription, restrictions, recareaid, recportal_unit_key, forestorgcode,
       spotlightdisplay, attractiondisplay, openstatus)
values
(2274, 30, 'Persido Bar River Access', -123.31688, 41.32688, 
       'https://www.fs.usda.gov/recarea/srnf/recarea/?recid=64831', 
       'Six Rivers National Forest', '/Internet/FSE_MEDIA/fsbdev2_016517.png', 
       'Beachcombing', 'Beaches & Dunes', '<p>Located approx. 19 miles upstream from Orleans, this access offers a bathroom, information kiosk and plenty of river access for bank fishing. The boat launch is large enough to launch drift and jet boats and is a very popular access for rafters.</p>', 
       'No Parking or Camping at Boat Ramp.', 64831, 11438, 510, 'N', 'N', 'open');


insert into Rec_Area(fid, internal_id, recareanam, longitude, latitude, recareaurl,
       feedescrip, forestname,
       markertype, markeractivity, markeractivitygroup,
       recareadescription, recareaid, recportal_unit_key, forestorgcode,
       spotlightdisplay, attractiondisplay, openstatus)
values
(2275, 31, 'Forks River Access and Boat Ramp', -124.05587, 41.79842, 
       'https://www.fs.usda.gov/recarea/srnf/recarea/?recid=80106', 'No fee.', 
       'Six Rivers National Forest', '/Internet/FSE_MEDIA/fsbdev2_016830.png', 
       'Boating - Non-Motorized', 'Water Activities', 
       '<p>Launch your boat or enjoy the fishing, swimming, and sunbathing opportunities at this&nbsp;Smith River&nbsp;access. Restroom facilities available at boat-trailer parking lot.</p>', 
       80106, 11438, 510, 'N', 'N', 'open'); 


insert into Rec_Area(fid, internal_id, recareanam, longitude, latitude, recareaurl,
       feedescrip, open_season_start, open_season_end, forestname,
       reservation_info, markertype, markeractivity, markeractivitygroup,
       recareadescription, recareaid, recportal_unit_key, forestorgcode,
       infra_cn, spotlightdisplay, attractiondisplay, openstatus)
values
(2284, 32, 'Mad River Campground', -123.465815, 40.401649, 
       'https://www.fs.usda.gov/recarea/srnf/recarea/?recid=11522', '$12 per night', 
       '17-May-19', '16-Sep-19', 'Six Rivers National Forest', 
       'Reservations available on <a href=""http://www.recreation.gov"">Recreation.gov</a>.',
       '/Internet/FSE_MEDIA/fsbdev2_016579.png', 'Campground Camping', 'Camping & Cabins', 
       '<p>There is a 14-day limit for occupying a campground, and pets on leashes are permitted.</p>', 
       11522, 11438, 510, 5046.004041, 'N', 'N', 'closed'); 


insert into Rec_Area(fid, internal_id, recareanam, longitude, latitude, recareaurl,
       feedescrip, open_season_start, open_season_end, forestname,
       reservation_info, markertype, markeractivity, markeractivitygroup,
       recareadescription, recareaid, recportal_unit_key, forestorgcode,
       infra_cn, spotlightdisplay, attractiondisplay, openstatus)
values
(2285, 33, 'Bailey Canyon Campground', -123.400669, 40.339723, 
       'https://www.fs.usda.gov/recarea/srnf/recarea/?recid=11523', '$12 per night', 
       '17-May-19', '16-Sep-19', 'Six Rivers National Forest', '&nbsp;No reservations.', 
       '/Internet/FSE_MEDIA/fsbdev2_016579.png', 'Campground Camping', 'Camping & Cabins', 
       '<p>There is a 14-day limit for occupying a campground, and pets on leashes are permitted.</p>', 
       11523, 11438, 510, 5126.004041, 'N', 'N', 'closed'); 


insert into Rec_Area(fid, internal_id, recareanam, longitude, latitude, recareaurl,
       feedescrip, open_season_start, open_season_end, forestname,
       reservation_info, markertype, markeractivity, markeractivitygroup,
       recareadescription, recareaid, recportal_unit_key, forestorgcode,
       infra_cn, spotlightdisplay, attractiondisplay, openstatus)
values
(2286, 34, 'Fir Cove Campground', -123.404789, 40.341751,
       'https://www.fs.usda.gov/recarea/srnf/recarea/?recid=11524', '$12 per night', 
       '17-May-19', '16-Sep-19', 'Six Rivers National Forest', 
       'Reservations are available at <a href=""http://www.recreation.gov"">Recreation.gov</a>.', 
       '/Internet/FSE_MEDIA/fsbdev2_016579.png', 'Campground Camping', 'Camping & Cabins',
       '<p>There is a 14-day limit for occupying a campground, and pets on leashes are permitted.</p>', 
       11524, 11438, 510, 5045.004041, 'N', 'N', 'closed'); 


insert into Rec_Area(fid, internal_id, recareanam, longitude, latitude, recareaurl,
       forestname,
       markertype, markeractivity, markeractivitygroup,
       recareadescription, recareaid, recportal_unit_key, forestorgcode,
       spotlightdisplay, attractiondisplay, openstatus)
values
(2287, 35, 'Mount Lassic Wilderness', -123.552246, 40.334437, 
       'https://www.fs.usda.gov/recarea/srnf/recarea/?recid=11552', 
       'Six Rivers National Forest', '/Internet/FSE_MEDIA/fsbdev2_016687.png', 
       'Backpacking', 'Hiking', '<p>7,280 acres on the Mad River District</p>', 11552,
       11438, 510, 'N', 'N', 'none'); 


insert into Rec_Area(fid, internal_id, recareanam, longitude, latitude, recareaurl,
       forestname,
       markertype, markeractivity, markeractivitygroup,
       recareadescription, recareaid, recportal_unit_key, forestorgcode,
       infra_cn, spotlightdisplay, attractiondisplay, openstatus)
values
(2288, 36, 'Orleans Ranger District', -123.542118, 41.300942, 
       'https://www.fs.usda.gov/recarea/srnf/recarea/?recid=11553', 
       'Six Rivers National Forest', '/Internet/FSE_MEDIA/fsbdev2_016717.png', 
       'Intermediate Parent Group', 'Intermediate Parent Group', 
       '<p>The District is one of four on the Six Rivers National Forest, encompassing approximately 500,000 acres. Located about 30 miles from the Northern Coast of California and subsequently under a coastal influence that produces a long summer season.</p>', 
       11553, 11438, 510, 5010.004041, 'N', 'N', 'none'); 


insert into Rec_Area(fid, internal_id, recareanam, longitude, latitude, recareaurl,
       feedescrip, open_season_start, forestname,
       markertype, markeractivity, markeractivitygroup,
       recareadescription, recareaid, recportal_unit_key, forestorgcode,
       infra_cn, spotlightdisplay, attractiondisplay, openstatus)
values
(2289, 37, 'Aikens Creek West Campground', -123.654428, 41.228918, 
       'https://www.fs.usda.gov/recarea/srnf/recarea/?recid=11555', 'No fee.', 
       'All Year', 'Six Rivers National Forest', '/Internet/FSE_MEDIA/fsbdev2_016657.png',
       'Campground Camping', 'Camping & Cabins', '<p>Trailer spaces available.</p>', 
       11555, 11438, 510, 5275.004041, 'N', 'N', 'open'); 


insert into Rec_Area(fid, internal_id, recareanam, longitude, latitude, recareaurl,
       feedescrip, open_season_start, open_season_end, forestname,
       reservation_info, markertype, markeractivity, markeractivitygroup,
       recareadescription, recareaid, recportal_unit_key, forestorgcode,
       infra_cn, spotlightdisplay, attractiondisplay, openstatus)
values
(2290, 38, 'Dillon Creek Campground', -123.539178, 41.575738, 
       'https://www.fs.usda.gov/recarea/srnf/recarea/?recid=11556', 
       '$10.00 per night for camping, $5.00 extra vehicle fee $ 5.00&nbsp;for day use', 
       '18-May-19', '13-Oct-19', 'Six Rivers National Forest', 
       'Reservations can be made through <a href="http://www.recreation.gov">www.recreation.gov</a>. Reservations available for the following dates: May&nbsp;18 to October 13, 2019.',
       '/Internet/FSE_MEDIA/fsbdev2_016657.png', 'Campground Camping', 'Camping & Cabins',
       '<p>The roar of cascading Dillon Creek provides the perfect atmosphere for a peaceful, yet adventurous stay in the densely wooded Siskiyou Mountains.</p><p>Dillon&#39;s mountainous terrain combines the warmth of the summer sun with cool gentle breezes.</p>',
       11556, 11438, 510, 5093.003771, 'N', 'N', 'open'); 


insert into Rec_Area(fid, internal_id, recareanam, longitude, latitude, recareaurl,
       forestname,
       markertype, markeractivity, markeractivitygroup,
       recareadescription, recareaid, recportal_unit_key, forestorgcode,
       spotlightdisplay, attractiondisplay, openstatus)
values
(2291, 39, 'Doe Flat Trailhead', -123.706847, 41.814113, 
       'https://www.fs.usda.gov/recarea/srnf/recarea/?recid=81414', 
       'Six Rivers National Forest', '/Internet/FSE_MEDIA/stelprdb5175876.png', 
       'Trailhead', 'Trailhead', 
       '<div>4.25 miles&nbsp;</div><div>Easy/moderate&nbsp;</div><div>Trailhead elevation: 4500&#39;&nbsp;</div><div>Trail end elevation: 3200&#39;&nbsp;</div><div>Driving time: 1.2 hours&nbsp;</div><div>&nbsp;</div>', 
       81414, 11438, 510, 'N', 'N', 'open'); 


insert into Rec_Area(fid, internal_id, recareanam, longitude, latitude, recareaurl,
       feedescrip, open_season_start, open_season_end, forestname,
       markertype, markeractivity, markeractivitygroup,
       recareadescription, recareaid, recportal_unit_key, forestorgcode,
       infra_cn, spotlightdisplay, attractiondisplay, openstatus)
values
(2302, 40, 'E-Ne-Nuck Campground', -123.660178, 41.233953, 
       'https://www.fs.usda.gov/recarea/srnf/recarea/?recid=11557', 
       '$10.00 per night for camping.', '15-Jun-19', '13-Oct-19', 
       'Six Rivers National Forest', '/Internet/FSE_MEDIA/fsbdev2_016657.png', 
       'Campground Camping', 'Camping & Cabins', 
       '<p>A popular spot for fishing enthusiasts alike, this small campground offers 10 campsites for those desiring to stay at a prime&nbsp;location to get their catch.&nbsp;It is conveniently located&nbsp;by some of the best fishing holes on the Klamath River.</p>', 
       11557, 11438, 510, 5283.004041, 'N', 'N', 'open'); 


insert into Rec_Area(fid, internal_id, recareanam, longitude, latitude, recareaurl,
       feedescrip, open_season_start, open_season_end, forestname,
       reservation_info, markertype, markeractivity, markeractivitygroup,
       recareadescription, recareaid, recportal_unit_key, forestorgcode,
       infra_cn, spotlightdisplay, attractiondisplay, openstatus)
values
(2303, 41, 'Fish Lake Campground', -123.682108, 41.265089, 
       'https://www.fs.usda.gov/recarea/srnf/recarea/?recid=11558', 
       '$10.00 per night for camping, $5.00 extra vehicle fee $5.00 day use', 
       '15-Jun-19', '30-Sep-19', 'Six Rivers National Forest', 
       'Reservations can be made through <a href="http://www.recreation.gov">Recreation.gov</a>. Sites 3-4, 7, 10-12, 12, 20&nbsp;and 22 are reservable. Reservations available for the following dates: June 15 to September 30, 2019.', 
       '/Internet/FSE_MEDIA/fsbdev2_016657.png', 'Campground Camping', 'Camping & Cabins', 
       '<p>Fish Lake Campground is located appoximately 1,780 feet above sea level in a mixed hardwood and confier forest with many fir and Port-Orford-cedar trees. There are five vault type unisex accessible restrooms.</p>', 
       11558, 11438, 510, 5037.004041, 'N', 'N', 'open'); 


insert into Rec_Area(fid, internal_id, recareanam, longitude, latitude, recareaurl,
       open_season_start, forestname,
       reservation_info, markertype, markeractivity, markeractivitygroup,
       recareadescription, recareaid, recportal_unit_key, forestorgcode,
       infra_cn, spotlightdisplay, attractiondisplay, openstatus)
values
(2304, 42, 'Nordheimer Campground', -123.361875, 41.299171, 
       'https://www.fs.usda.gov/recarea/srnf/recarea/?recid=11559', 'All year.', 
       'Six Rivers National Forest', 
       'Group sites available by reservation only. No reservation required for non-group sites.', 
       '/Internet/FSE_MEDIA/fsbdev2_016517.png', 'Beachcombing', 'Beaches & Dunes', 
       '<p>Nordheimer Campground and Group Sites are located in a Douglas fir and hardwood forest close to the Wild and Scenic California Salmon River. Roads and parking areas are gravel. The main campround has 12 sites located under shady trees.</p>', 
       11559, 11438, 510, 5092.003771, 'N', 'N', 'open'); 
       

insert into Rec_Area(fid, internal_id, recareanam, longitude, latitude, recareaurl,
       feedescrip, open_season_start, open_season_end, forestname,
       reservation_info, markertype, markeractivity, markeractivitygroup,
       recareadescription, recareaid, recportal_unit_key, forestorgcode,
       infra_cn, spotlightdisplay, attractiondisplay, openstatus)
values
(2319, 43, 'Oak Bottom Campground', -123.115809, 41.809461, 
       'https://www.fs.usda.gov/recarea/srnf/recarea/?recid=11560', 
       '$10.00 per night for camping which includes 1 vehicle. An additional $5 fee is charged for a second vehicle.', 
       '1-Jan-19', '31-Oct-19', 'Six Rivers National Forest', 
       'Reservations can be made through <a href=""http://www.recreation.gov"">www.recreation.gov</a>.', 
       '/Internet/FSE_MEDIA/fsbdev2_016517.png', 'Beachcombing', 'Beaches & Dunes', 
       '<p>Oak Bottom Campground is located on a gently sloping hillside in a mixed Douglas fir and hardwood forest. It offers a peacefull environment, free from road noise and other distractions.</p>', 
       11560, 11438, 510, 5091.003771, 'N', 'N', 'open'); 


insert into Rec_Area(fid, internal_id, recareanam, longitude, latitude, recareaurl,
       feedescrip, open_season_start, open_season_end, forestname,
       reservation_info, markertype, markeractivity, markeractivitygroup,
       recareadescription, recareaid, recportal_unit_key, forestorgcode,
       infra_cn, spotlightdisplay, attractiondisplay, openstatus)
values
(2320, 44, 'Pearch Creek Campground', -123.521218, 41.310751, 
       'https://www.fs.usda.gov/recarea/srnf/recarea/?recid=11561', 
       '$10.00 per night for camping.', '18-May-19', '31-Oct-19', 
       'Six Rivers National Forest', 
       'Reservations available at <a href="http://www.recreation.gov">www.recreation.gov</a>. Reservations available for the following dates: May 18 to October 31, 2019.', 
       '/Internet/FSE_MEDIA/fsbdev2_016657.png', 'Campground Camping', 'Camping & Cabins', 
       '<p>Pearch Creek Campground is located in a mature Douglas fir and hardwood forest. The sound of Pearch Creek can be heard from most sites and the campround remains shady and cool during hot summer days.', 
       11561, 11438, 510, 5038.004041, 'N', 'N', 'open'); 


insert into Rec_Area(fid, internal_id, recareanam, longitude, latitude, recareaurl,
       open_season_start, open_season_end, forestname,
       markertype, markeractivity, markeractivitygroup,
       recareadescription, recareaid, recportal_unit_key, forestorgcode,
       spotlightdisplay, attractiondisplay, openstatus)
values
(2321, 45, 'Fish Lake', -123.683889, 41.265278, 
       'https://www.fs.usda.gov/recarea/srnf/recarea/?recid=11582', '15-Jun-19', 
       '30-Sep-19', 'Six Rivers National Forest', '/Internet/FSE_MEDIA/fsbdev2_016517.png',
       'Beachcombing', 'Beaches & Dunes', 
       '<p>Fish Lake is located in the southwestern portion of the Orleans Ranger District. As one of the most popular recreational areas on the District, Fish Lake offers camping, fishing and hiking on over 5 miles of trails.</p>', 
       11582, 11438, 510, 'N', 'N', 'closed');  


-- Reset ampersands to allow for input prompting again 
set define on 

Feature: Validate Google Calendars API

Scenario: Create a calendar and Event, Update Event and Delete Event and Calendar
Given url "https://www.googleapis.com/calendar/v3/calendars"
And header Authorization = "Bearer ya29.a0ARrdaM9ZJvgArYfTzpgNdltsIfAPotWfsEpTYT3HiWV64hnbfWZdF77Efv7-ufPGOgHVTmNb4_BW19Y312yUTRVlUG9qId7UH81lykn63f75SV5VwNgvj4CAo5Ifr_1_EI_Fmn_re-XvquIj3AxH0BOPu7rX"
And request {'summary':'Karate Calendar'}
When method post
Then def cid = response.id
Then status 200


Given path cid+'/events'
And header Authorization = "Bearer ya29.a0ARrdaM9ZJvgArYfTzpgNdltsIfAPotWfsEpTYT3HiWV64hnbfWZdF77Efv7-ufPGOgHVTmNb4_BW19Y312yUTRVlUG9qId7UH81lykn63f75SV5VwNgvj4CAo5Ifr_1_EI_Fmn_re-XvquIj3AxH0BOPu7rX"
And request {'end':{'date':'2021-09-10'},'start':{'date':'2021-08-25'}}
When method post
Then def eid = response.id
Then status 200

Given path cid+'/events/'+eid
And header Authorization = "Bearer ya29.a0ARrdaM9ZJvgArYfTzpgNdltsIfAPotWfsEpTYT3HiWV64hnbfWZdF77Efv7-ufPGOgHVTmNb4_BW19Y312yUTRVlUG9qId7UH81lykn63f75SV5VwNgvj4CAo5Ifr_1_EI_Fmn_re-XvquIj3AxH0BOPu7rX"
And request {'summary':'Updated Event Name'}
When method patch
Then status 200

Given path cid+'/events/'+eid
And header Authorization = "Bearer ya29.a0ARrdaM9ZJvgArYfTzpgNdltsIfAPotWfsEpTYT3HiWV64hnbfWZdF77Efv7-ufPGOgHVTmNb4_BW19Y312yUTRVlUG9qId7UH81lykn63f75SV5VwNgvj4CAo5Ifr_1_EI_Fmn_re-XvquIj3AxH0BOPu7rX"
When method delete
Then status 204

Given path cid
And header Authorization = "Bearer ya29.a0ARrdaM9ZJvgArYfTzpgNdltsIfAPotWfsEpTYT3HiWV64hnbfWZdF77Efv7-ufPGOgHVTmNb4_BW19Y312yUTRVlUG9qId7UH81lykn63f75SV5VwNgvj4CAo5Ifr_1_EI_Fmn_re-XvquIj3AxH0BOPu7rX"
When method delete
Then status 204
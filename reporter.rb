require_relative 'features/support/api_helper'
require 'json'

job_name = ARGV[0]
job_number = ARGV[1]


thumbnail = {'url' => 'https://i2-prod.mirror.co.uk/incoming/article6193323.ece/ALTERNATES/s615b/Amateur-gardener-Phillip-Vowles-hopes-for-success-with-massive-marrow-which-already-weighs-150Ibs.jpg'}

fields = []

fields.push({'name' => 'Autors', 'value' => 'Sandis'})
fields.push({'name' => 'Mērķis', 'value' => 'REST API'})
fields.push({'name' => 'Job', 'value' => job_name})
fields.push({'name' => 'Build number', 'value' => job_number})

embed = []

embed.push('title' => 'Cucumber',
           'color' => 2446666,
           'thumbnail' => thumbnail,
           'fields' => fields)

payload = {
    'content' => 'Sandis Babauskis',
    'embeds' => embed,
}.to_json

API.post('https://discordapp.com/api/webhooks/459005793627406359/-6FGK6la-XlTO_UZ2G62Cx-TZ0AwmMqIPd3rBkusV1nwPQo1RlmhAp3Kaxn_gHS85Aqs',
        headers: { 'Content-Type' => 'application/json' },
        cookies: {},
        payload: payload)

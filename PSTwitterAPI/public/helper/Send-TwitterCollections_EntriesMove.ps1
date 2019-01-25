﻿function Send-TwitterCollections_EntriesMove {
<#
.SYNOPSIS
    Curate a collection of Tweets

.DESCRIPTION
    POST collections/entries/move
    
    Move a specified Tweet to a new position in a curation_reverse_chron ordered collection.

.PARAMETER id
    The identifier of the Collection receiving the Tweet.

.PARAMETER tweet_id
    The identifier of the Tweet to add to the Collection.

.PARAMETER relative_to
    The identifier of the Tweet used for relative positioning.

.PARAMETER above
    Set to false to insert the specified tweet_id below the relative_to Tweet in the collection. Default: true

.NOTES
    This helper function was generated by the information provided here:
    https://developer.twitter.com/en/docs/tweets/curate-a-collection/api-reference/post-collections-entries-move

#>
    [CmdletBinding()]
    Param(
        [string]$id,
        [string]$tweet_id,
        [string]$relative_to,
        [string]$above
    )
    Begin {

        [hashtable]$Parameters = $PSBoundParameters
                   $CmdletBindingParameters | ForEach-Object { $Parameters.Remove($_) }

        [string]$Method      = 'POST'
        [string]$Resource    = '/collections/entries/move'
        [string]$ResourceUrl = 'https://api.twitter.com/1.1/collections/entries/move.json'

    }
    Process {

        # Find & Replace any ResourceUrl parameters.
        $UrlParameters = [regex]::Matches($ResourceUrl, '(?<!\w):\w+')
        ForEach ($UrlParameter in $UrlParameters) {
            $UrlParameterValue = $Parameters["$($UrlParameter.Value.TrimStart(":"))"]
            $ResourceUrl = $ResourceUrl -Replace $UrlParameter.Value, $UrlParameterValue
        }

        If (-Not $OAuthSettings) { $OAuthSettings = Get-TwitterOAuthSettings -Resource $Resource }
        Invoke-TwitterAPI -Method $Method -ResourceUrl $ResourceUrl -Parameters $Parameters -OAuthSettings $OAuthSettings

    }
    End {

    }
}

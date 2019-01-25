﻿function Get-TwitterBlocks_Ids {
<#
.SYNOPSIS
    Mute, block and report users

.DESCRIPTION
    GET blocks/ids
    
    Returns an array of numeric user ids the authenticating user is blocking.
    
    Important This method is cursored, meaning your app must make multiple requests in order to receive all blocks correctly. See Using cursors to navigate collections for more details on how cursoring works.

.PARAMETER stringify_ids
    Many programming environments will not consume Twitter IDs due to their size. Provide this option to have IDs returned as strings instead. Read more about Twitter IDs .

.PARAMETER cursor
    Causes the list of IDs to be broken into pages of no more than 5000 IDs at a time. The number of IDs returned is not guaranteed to be 5000 as suspended users are filtered out after connections are queried. If no cursor is provided, a value of -1 will be assumed, which is the first "page."
The response from the API will include a previous_cursor and next_cursor to allow paging back and forth. See Using cursors to navigate collections for more information.

.NOTES
    This helper function was generated by the information provided here:
    https://developer.twitter.com/en/docs/accounts-and-users/mute-block-report-users/api-reference/get-blocks-ids

#>
    [CmdletBinding()]
    Param(
        [string]$stringify_ids,
        [string]$cursor
    )
    Begin {

        [hashtable]$Parameters = $PSBoundParameters
                   $CmdletBindingParameters | ForEach-Object { $Parameters.Remove($_) }

        [string]$Method      = 'GET'
        [string]$Resource    = '/blocks/ids'
        [string]$ResourceUrl = 'https://api.twitter.com/1.1/blocks/ids.json'

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

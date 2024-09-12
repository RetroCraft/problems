#let Relationships_Transactions = [
  == Secured Transactions
  
  === Definitions
  A *secured transaction* generally is a loan or creditor where the lender acquires a "security" interest in collateral owned by the borrower. The lender is entitled to foreclose on or repossess the collateral in the event of a borrower's default. Think of a collateralized loan.

  In general, there are 3 ways to create a secured transaction:
  #block(inset:(left:1em))[
    - Contractual: make a contract for it
    - Statutory: for example, not paying your mechanic allows them to repossess your car 
    - Common Law: notably *bailment* - the rightful possession of someone else's property with the understanding it will be returned to the rightful owner later; or that they will follow the instructions of the rightful owners when asked. Basically borrowing. 
  ]

  In these relationships, the *creditor* is the loaner, and the *debtor* is the borrower.
  
  A *collateral security* is an interest in the property of a debtor that gives a creditor the right to seize and sell it in the event of non-payment of debt. It is this collateral security that is given to the creditor.

  === Creditor Statuses & Priority

  ==== Secured Creditors
  *Secured Creditors* have top priority when it comes to collection. They have the right to take possession of and sell specific assets in satisfaction of a debt. They *do not need a court judgment to seize assets*. They arise through agreements, statutory or common law rights.
  
  ==== Judgement Creditors
  *Judgement Creditors* have obtained a judgment through the courts. They can obtain an execution order or writ authorizing the seizure and sale of certain assets by the sheriff. They also get examinations to discover where assets are and can garnish wages and so on. 
  
  ==== Unsecured/General Creditors
  *Unsecured Creditors* are creditors who have no security interest in any of the debtor's property. No security means no right to seize any of the assets. They are paid out last.

  ==== An Example
  Say the debtor pays \$200k to get a mortgage on a house worth \$1m. The bank loans out \$800k. Now, they are a secured creditor for the loan, interest, and costs. Their security interest is the house.

  Say the debtor defaults with \$700k in outstanding mortgage with interest and costs. They also owe judgment creditors \$125k and unsecured creditors \$60k. The house is seized and sold for \$750k, after subtracting the *cost of collecting* from the sheriff.

  Secured creditors get all \$700k of their debt collected, plus interest and costs. Judgment creditors collect the remaining \$50k, leaving a \$75k deficit plus interest and costs. Unsecured creditors get nothing, and the debtor gets nothing.

  ==== Security in Bankruptcy
  When you go bankrupt, the order of priority is slightly different:
  #block(inset:(left:1em))[
    1. Secured Creditors, but of course
    2. Reasonable funeral and testamentary expenses, if you happened to die in bankruptcy
    3. Administration costs, including the expenses and fees of the trustee-in-bankruptcy - they must be paid for their work, and it's not like it's coming out of their own pocket
    4. *Preferred creditors* - unsecured creditors who are preferred by legislation, like employee claims, spouse claims, child support, municipal taxes, and landlord claims
    5. All other unsecured creditors.
  ]
  
  === Real and Personal Property
  *Real Property* is land and anything *permanently affixed* to it, called *fixtures*. Land stretches from the heavens to the core of the Earth, and fixtures are determined by how difficult it would be to move it. *Personal Property* is basically anything that isn't real property.
  
  === Motivation for Secured Transactions
  Creditors want to take a security interest whenever it is practical to do so. Here are some factors:
  #block(inset:(left:1em))[
    - It provides incentives to the debtor to pay, to prevent their assets from being seized
    - The reduced risk allows them to sell to high-risk creditors while balancing their risk (more profit)
    - Goods that maintain their value over time are usually better as a security against a loan
    - Security interests work better for long-term debts, reducing long-term risk
  ]
  Also a Business Risk Management thing - if credit amounts are small, it might be better to simply "write-off" a small percent of the bad debt than enforce the security. What, too expensive to collect?
  
  === Types of Security Interest
  ==== Conditional Sales Contracts
  These occur when a sale is agreed to, but the legal transfer of ownership is delayed until the buyer completes scheduled payments. Think of payment plans for a fridge. You get equitable title in possessing the good, but true ownership remains with the creditor.

  The creditor has the *right to repossess* the goods if the debtor defaults, as well as sue for any balance outstanding after said goods are resold (ex. loss from depreciation). They are also a secured creditor and have priority. However, they are *not entitled to use force* - the conditional seller must deal with the debtor with *fair dealing*, like giving 2 weeks notice before seizure. These contracts are often sold/assigned to third parties who specifically collect installments and administer the contracts.
  
  ==== Chattel Mortgages
  *Chattel mortgages* are mortgages on personal property, between the *mortgagor* (debtor) and the *mortgagee* (creditor). They arise in 1 of two ways:
  #block(inset:(left:1em))[
    - The Mortgagor purchases an article of property and the vendor "takes back" a mortgage on the article sold. Title is transferred to the buyer with possession, and they are immediately charged with a debt to the buyer, who is the mortgagee.
    - The mortgagor already owns the article, giving the mortgagee a mortgage against it to secure a debt. For instance, mortgaging it to a bank to pay for the article being mortgaged or some other different purchase.
  ]

  Chattel mortgages are also commonly seen when a building is sold with its equipment and furnishings. 2 different mortgages would be taken out in exchange for a loan - a real estate mortgage for the real property and land, and an additional Chattel mortgage on all the equipment. 

  ===== After-Acquired Property
  Chattel mortgages on *after-acquired property* also exist, which is property acquired by the debtor after the debt is incurred. This is property that is non-existent at mortgage creation, which may include inventory. This is obviously a problem - who will buy your stuff if the bank has a right to repossess it? 

  The solution is that the mortgage does not transfer title to specific goods to the creditor, allowing purchasers to obtain good title in ordinary business. The creditor holds *suspended priority* over other creditors - meaning the rights of the secured creditor only kick in when they default. TLDR: It's not actually a problem - the seizures only happen after you default on your mortgage.

  ==== Floating Charges
  A *floating charge* is a form of mortgage on all assets of a corporation other than those already charged. You'd take out a normal mortgage, a Chattel mortgage, and then floating charges.
  
  ==== Pledges
  These are transfers of an asset from a debtor to a creditor to secure repayment of a debt. Think of pawn shop loans - you pawn something for money, securing your eventual repayment of that money. 
  
  ==== Assignment of Book Debts
  Through contract assignment, you can turn your accounts receivable into security interests.
  
  === PPSAs
  *Personal Property Security Act*(s) are *provincial level acts* that generally cover the creation, perfection, and registration of everything that creates security interests - anything mentioned above, leases, consignments intended as security, and other less common forms.

  The fundamental goals of PPSA are to:
  #block(inset:(left:1em))[
    1. Define and Standardize remedies a secured party has against a defaulting debtor
    2. Create a system of registration to record and give notice of all secured interests
    3. Define and set priorities between secured creditors and general creditors
  ]

  ==== Creation, Attachment, Perfection
  Under PPSA, a security interest is *created* when the creditor and debtor enter some form of agreement or contract, under the normal 7 elements of contract rules. It's a contract that does the thing, ok?

  *Attachment* is the moment in time when a debtor's property becomes subject to a security interest. This occurs when the security agreement is performed by both parties - value for the secured interest is given, the debtor had acquired a right to the interest beforehand, and the 2 parties approve the contract.

  *Perfection* is the moment in time when a creditor's security interest becomes protected by law. This occurs when the secured party *takes possession*, OR once the interest is *registered with PPSA*.

  ==== Priority and Competing Interests
  If 2 people have security over the same assets, the *first to register/perfect* their interest gets priority. The other person can still become a judgment creditor and sue - they just lose their right to the secured property. There is also special priority for *purchase-money security interests (PMSI)* - interests from when goods purchased by the debtor are charged as security as a loan to enable those goods to be bought. This is in place to get around floating charge security interests that may otherwise stall a business from being able to obtain new credit to finance purchases and unstuck itself. (Lest everything they buy becomes part of the floating charge and gets immediately taken lol)

  ==== Effects on Purchasers
  #block(inset:(left:1em))[
    1. *Possession and Ownership are separated*, which can mislead third parties and subsequent purchasers. Thus PPSA requires all goods that are security interests but in possession of the debtor to be registered, so go check.
    2. After registration, a properly registered security interest *gives priority against innocent third parties* - as they are now deemed to have notice of the charge.
    3. There is an exception for *good faith purchasers* - some provinces exempt good faith purchases of small value goods under \$1000, as well as goods sold/leased in the ordinary course of business. 
  ]
  
  ==== In Practice, Who Registers?
  Low-valued retailers are unlikely to register, as it may not be worth the effort to register, sue and recover. However, manufacturers and wholesalers in B2B may register since businesses have higher risk and they want to maintain their priority. *Remember to maintain perfection if there are any changes to terms, or if it expires*.

  ==== Other Conflicting Priorities
  Conflicts can still arise from interprovincial disputes, security interests outside of PPSA, and federal legislation outside of PPSA, like the Bank Act. Just be aware of these, I guess.
  
  === Intangible Property
  *Intangible Property* are personal items of value that cannot be touched or physically held, like book debt, copyrights, patents, digital assets, etc. Can be owned by either individuals or corporations.

  These can work as secured interests - assigning book debt creates a security interest in the debtor's accounts receivable, although, unlike true assignment of contractual rights, the assignment only occurs on default; Investment property (like stocks and futures contracts) gets special treatment under PPSA - they can be perfected by the creditor simply having "control" of the investment property, rather than physical ownership, as usually these are held in banks or other intermediaries. Priority goes to the creditor who first obtains control. Interests perfected by control get priority over registration.
]
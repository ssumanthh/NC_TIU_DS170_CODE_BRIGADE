import re
from datetime import timedelta

import gensim
import numpy as np
import pandas as pd
import requests
import spacy
import streamlit as st
import yfinance as yfin
from bs4 import BeautifulSoup
from matplotlib import pyplot as plt
from pandas_datareader import data as pdr
from sklearn.feature_extraction.text import CountVectorizer, TfidfVectorizer
from wordcloud import WordCloud


from pdfminer.pdfinterp import PDFResourceManager, PDFPageInterpreter
from pdfminer.converter import TextConverter
from pdfminer.layout import LAParams
from pdfminer.pdfpage import PDFPage
from io import StringIO
import docx2txt
from striprtf.striprtf import rtf_to_text


yfin.pdr_override()

spacy_model = 'en_core_web_sm'
nlp = spacy.load(spacy_model)

# with st.form(key='columns_in_form'):
#     c1, c2, c3, c4 = st.columns(4)
#     with c1:
#         initialInvestment = st.text_input("Starting capital",value=500)
#     with c2:
#         monthlyContribution = st.text_input("Monthly contribution (Optional)",value=100)
#     with c3:
#         annualRate = st.text_input("Annual increase rate in percentage",value="15")
#     with c4:
#         investingTimeYears = st.text_input("Duration in years:",value=10)
#     submitButton = st.form_submit_button(label = 'Calculate')

# st.write("Select the option to upload")
# urlbutton = st.button("URL")
# filebutton = st.button("Files")

# select=False
# button=False

# if(urlbutton):
# buff, col, buff2 = st.columns([1,3,1])
# col.text_input('smaller text window:')
st.title("Company 1")
c1, c2 = st.columns(2)
with c1:
    tick = st.text_input("Ticker")
with c2:
    year = st.text_input("Year")



st.write("Enter 4 URL")
c2, c3 = st.columns(2)
with c2:
    url1 = st.text_input("q1", placeholder="Enter URL")
with c3:
    url2 = st.text_input("q2", placeholder="Enter URL")

c4, c5 = st.columns(2)
with c4:
    url3 = st.text_input("q3", placeholder="Enter URL")

with c5:
    url4 = st.text_input("q4", placeholder="Enter URL")

st.write("OR")
file1 = st.file_uploader("4 files ", accept_multiple_files=True)

st.title("Company 2")
c6, c7 = st.columns(2)
with c6:
    tick1 = st.text_input("Ticker 2")
with c7:
    year1 = st.text_input("Year 2")



st.write("Enter 4 URL")
c8, c9 = st.columns(2)
with c8:
    url11 = st.text_input("qt1", placeholder="Enter URL")
with c9:
    url12 = st.text_input("qt2", placeholder="Enter URL")

c14, c15 = st.columns(2)
with c14:
    url13 = st.text_input("qt3", placeholder="Enter URL")

with c15:
    url14 = st.text_input("qt4", placeholder="Enter URL")

st.write("OR")
file2 = st.file_uploader("4 file", accept_multiple_files=True)


button = st.button("Generate Output")

if button == True :
    if  url1!=None :

        columns = ['ticker','quarter', 'year', 'url']
        data = [
            [tick,'q1',year,url1],
            [tick,'q2',year,url2],
            [tick,'q3',year,url3],
            [tick,'q4',year,url4],

          
        ]
        df = pd.DataFrame(data=data, columns=columns)
        df['call_date'] = df['url'].apply(lambda x : pd.to_datetime(re.match(r".*(\d{4}/\d{2}/\d{2})", x).group(1)))

        def get_text(df_row):
            st.write({df_row['url']})
            page = requests.get(df_row['url'])
            regex = re.compile(r'Prepared Remarks:\s*(\n*.*)\s*Duration:',re.DOTALL)
            matches = regex.finditer(page.text)
            plain_text=''
            for match in matches:
                # print(match)
                plain_text = BeautifulSoup(match.group(1), 'html.parser').get_text(separator='') # remove all the html
                plain_text = re.sub("\n|\r", ".", plain_text, flags=re.MULTILINE) # remove new line
                plain_text = re.sub("\s\s+|\t", " ", plain_text)
            return plain_text

        df['plain_text'] = df.apply(get_text, axis=1)
    else:
        columns = ['ticker','quarter', 'year', 'url', 'call_date']
        number_of_inps = 4
        data = [
                [tick,'q1', year, file1[3].name,'2019-08-01'],
                [tick,'q2', year, file1[2].name,'2019-11-08'],
            [tick,'q3', year, file1[1].name,'2020-01-29'],
            [tick,'q4', year, file1[0].name,'2020-03-19'],
            
           
           
            ]
        df = pd.DataFrame(data=data, columns=columns)
        df['call_date'] = pd.to_datetime(df['call_date'])

        def convert_rtf_to_text(path):
            with open(path) as file:
                content = file.read()
            text = rtf_to_text(content)
            return text
        def convert_docx_to_txt(path):
            text = docx2txt.process(path)
            return text
        def convert_pdf_to_txt(path):
            rsrcmgr = PDFResourceManager()
            retstr = StringIO()
            # codec = 'utf-8'
            laparams = LAParams()
            device = TextConverter(rsrcmgr, retstr, laparams=laparams)
            fp = open(path, 'rb')
            interpreter = PDFPageInterpreter(rsrcmgr, device)
            maxpages = 0
            caching = True
            pagenos=set()
            for page in PDFPage.get_pages(fp, pagenos, caching=caching, check_extractable=True):
                interpreter.process_page(page)
            text = retstr.getvalue()
            fp.close()
            device.close()
            retstr.close()
            return text
        text=""
        # iter_txt = []
        for i in range(number_of_inps):
            file_extns = df['url'][i].split(".")
            if(file_extns[-1]=="pdf"):
                print(f"Processing {df['url'][i]}")
                text = convert_pdf_to_txt(df['url'][i])
                text = re.sub("\n|\r", ".", text, flags=re.MULTILINE)
                text = re.sub("\s\s+|\t", " ", text)
                # print(text)
                df.at[i,'plain_text'] = text
            elif(file_extns[-1]=="rtf"):
                print(f"Processing {df['url'][i]}")
                text = convert_rtf_to_text(df['url'][i])
                text = re.sub("\n|\r", ".", text, flags=re.MULTILINE)
                text = re.sub("\s\s+|\t", " ", text)
                df.at[i,'plain_text'] = text
            else:
                print(f"Processing {df['url'][i]}")
                text = convert_docx_to_txt(df['url'][i])
                text = re.sub("\n|\r", ".", text, flags=re.MULTILINE)
                text = re.sub("\s\s+|\t", " ", text)
                df.at[i,'plain_text'] = text
    additional_stop_words = ['hi', 'earning', 'conference', 'speaker', 'analyst', 'operator', 'welcome', \
                            'think', 'cost', 'result', 'primarily', 'overall', 'line', 'general', \
                            'thank', 'see', 'alphabet', 'google', 'facebook', 'amazon', 'microsoft',\
                        'business', 'customer', 'revenue', 'question', 'lady', 'gentleman', \
                        'continue', 'continuing', 'continued', 'focus', 'participant', 'see', 'seeing', \
                        'user', 'work', 'lot', 'day',  'like', 'looking', 'look', 'come', 'yes', 'include', \
                        'investor', 'director', 'expense', 'manager', 'founder', 'chairman', \
                            'chief', 'operating', 'officer', 'executive', 'financial', 'senior', 'vice', 'president', \
                        'opportunity', 'go', 'expect', 'increase', 'quarter', 'stand', 'instructions', \
                        'obviously', 'thing', 'important', 'help', 'bring', 'mention', 'yeah', 'get', 'proceed', \
                        'currency', 'example', 'believe', '.','©'] 

    for stopword in additional_stop_words:
        nlp.vocab[stopword].is_stop = True

    def lemma_text(df_row):
        st.write(f"Processing {df_row['url']}, quarter: {df_row['quarter']}, year: {df_row['year']}")
        clean_text = []
        if isinstance(df_row['plain_text'],float):
            st.write(True)
        else:
            st.write(type(df_row['plain_text']))
        doc = nlp(df_row['plain_text'])
        with doc.retokenize() as retokenizer:
            for ent in doc.ents:
                # print(ent.text, ent.label_)
                retokenizer.merge(doc[ent.start:ent.end], attrs={"LEMMA": ent.text})
        #print('-------------------')
        for word in doc:
            # print(word, word.lemma_, word.ent_type_)
            if word.is_alpha and word.is_ascii and not word.is_stop and \
                word.ent_type_ not in ['PERSON','DATE', 'TIME', 'ORDINAL', 'CARDINAL'] and \
                word.text.lower() not in additional_stop_words and \
                word.lemma_.lower() not in additional_stop_words:
                    # print(word)
                    clean_text.append(word.lemma_.lower())
        
        return clean_text

    df['clean_text'] = df.apply(lemma_text, axis=1)
    print(df['clean_text'])

    tickers = df['ticker'].unique().tolist()
    for ticker in tickers:
        bigram = gensim.models.Phrases(df.loc[df['ticker']==ticker,'clean_text'], min_count=3)
        df.loc[df['ticker']==ticker,'words_ngrams'] = df.loc[df['ticker']==ticker,'clean_text'].apply(lambda x : bigram[x])

    additional_stop_words=['gross_margin', 'come_line', 'constant_currency', 'operatorthank_proceed', 'long_term', \
                        'grow_constant', 'year_year' , 'growth', 'strong', 'great', 'maybe','f_moderator','good_organize','managing_ceo', 'operatorhello_amd']

    def remove_bigrams(df_row):
        st.write("Processing:", df_row['ticker'], "year:", df_row['year'])
        words = []
        doc = df_row['words_ngrams']
        for word in doc:
            if word not in additional_stop_words:
                words.append(word)
        return words

    df['words_ngrams'] = df.apply(remove_bigrams, axis=1)
    st.write(df['words_ngrams'])

    tfidf_vectorizer = TfidfVectorizer(smooth_idf=True,use_idf=True, min_df=0.025)

    def get_wordcloud():
        tickers = df['ticker'].unique().tolist()
        num_top_words=100
        wc = WordCloud(width = 1000, height = 1000, 
                        background_color ='black', 
                        min_font_size = 20,
                        max_font_size=150,
                        colormap='Blues_r')
                        # colormap='Wistia')
        docs_joined = []
        num_tickers = len(tickers)
        for ticker in tickers:
            
            sub_df = df.loc[df['ticker']==ticker]
            sub_df = sub_df.sort_values('call_date',ascending=True)
            docs = sub_df['words_ngrams'].apply(lambda x: " ".join(x)).tolist()
            dates = sub_df['call_date'].tolist()
            # print(dates)
            num_dates = len(dates)

            idf_vector = tfidf_vectorizer.fit_transform(docs)
            index=0
            fig = plt.figure(figsize=(15,15))
            for dt, doc in zip(dates, docs):
                docs_joined.extend(doc)
                
                df_idf = pd.DataFrame(idf_vector[index].T.toarray(), index=tfidf_vectorizer.get_feature_names_out(),columns=["idf_weights"])
                dict_idf_topwrds = df_idf.sort_values(by=['idf_weights'],ascending=False)[:num_top_words].to_dict()['idf_weights']

                # if(choice == 'web'):
                plt.subplot(1*num_tickers, num_dates,index+1).set_title("WordCloud-" + ticker + " : " + str(dt.date()))
                # else:
                #   plt.subplot(1*num_tickers, num_dates,index+1).set_title("WordCloud-" + ticker + " : " + df['call_date'][index])
                wc.generate_from_frequencies(dict_idf_topwrds)
                # plot the WordCloud image                        
                plt.imshow(wc)
                plt.axis("off") 
                plt.tight_layout(pad = 1) 
                index += 1
        st.pyplot(fig)

    get_wordcloud()

    sentiments = ['negative', 'positive', 'uncertainty', 'litigious', 'constraining', 'interesting']

    sentiment_df = pd.read_csv('https://raw.githubusercontent.com/ark4innovation/datascience/master/ai-for-trading/5-nlp-on-financial-statements/loughran_mcdonald_master_dic_2016.csv')
    sentiment_df.columns = [column.lower() for column in sentiment_df.columns]

    # Remove unused information
    sentiment_df = sentiment_df[sentiments + ['word']]
    sentiment_df[sentiments] = sentiment_df[sentiments].astype(bool)
    st.write('before any sentiment_df.shape', sentiment_df.shape)
    sentiment_df = sentiment_df[(sentiment_df[sentiments]).any(1)]
    st.write('after any sentiment_df.shape', sentiment_df.shape)

    word_list = nlp(" ".join(sentiment_df['word'].str.lower()))
    word_lemmas = []
    for word in word_list:
        # print(word.text, word.lemma_)
        word_lemmas.append(word.lemma_)

    sentiment_df.insert(loc=7, column='lemma', value=word_lemmas)

    sentiment_df = sentiment_df.drop_duplicates('lemma')
    # print(f'after drop_duplicates sentiment_df.shape {sentiment_df.shape}')
    # print()
    # print(f'sentiment_df[sentiments].sum()-->\n{sentiment_df[sentiments].sum()}')

    df = df.reindex(columns= df.columns.to_list() + sentiments)

    sentiment_vectorizer = CountVectorizer()

    def get_sentiment_info(df_row, sentiment_vectorizer):
        vector = sentiment_vectorizer.transform([" ".join(df_row['clean_text'])])
        return np.sum(vector.toarray())

    for sentiment in sentiments:
        sentiment_words = sentiment_df.loc[sentiment_df[sentiment],'lemma']
        sentiment_vectorizer.fit(sentiment_words)
        df[sentiment] = df.apply(get_sentiment_info, args=(sentiment_vectorizer, ), axis=1)

    from matplotlib.transforms import Bbox
    fig = plt.figure(figsize=(15, 15))
    tickers = df['ticker'].unique()
    for index, ticker in enumerate(tickers):
        pos = 220 + index + 1 # to create fig.add_subplot(221), fig.add_subplot(222), fig.add_subplot(223), fig.add_subplot(224)
        ax1 = fig.add_subplot(pos)
        sub_df = df.loc[df['ticker']==ticker,['call_date']+sentiments]
        sub_df = sub_df.sort_values('call_date',ascending=True)
        ax1.plot(sub_df['call_date'], sub_df[sentiments], marker='s')
        plt.xlabel('Date')
        plt.ylabel('No. of words')
        ax1.set_title(ticker)
        plt.setp(ax1.get_xticklabels(), rotation=30, horizontalalignment='right')
        ax1.legend(sentiments, loc='upper left')
    plt.savefig('testimage.png', bbox_inches = 'tight')
    st.pyplot(fig)

    days_after=30
    tickers = df['ticker'].unique().tolist()

    start_date = df['call_date'].min()
    end_date = df['call_date'].max() + timedelta(days=days_after)

    st.write(start_date, end_date)
    ohlc_df =  pdr.get_data_yahoo(tickers, start_date, end_date)
    close_df = ohlc_df['Close']

    fig = plt.figure(figsize=(15, 15))
    fig.autofmt_xdate()
    ticker = df['ticker'].unique()
    # for index, ticker in enumerate(tickers):
    pos = 221 # to create fig.add_subplot(221), fig.add_subplot(222), fig.add_subplot(223), fig.add_subplot(224)
    ax1 = fig.add_subplot(pos)

    sub_df = df.loc[ticker,['call_date']+sentiments]
    sub_df = sub_df.sort_values('call_date',ascending=True)
    
    valid_date_range = \
    ((close_df.index >= sub_df['call_date'].min()) & 
    (close_df.index <= sub_df['call_date'].max() + timedelta(days=days_after)))
    st.write(valid_date_range)
    price_sub_df = close_df.loc[valid_date_range,ticker]
    color = 'tab:pink'
    ax1.set_xlabel('date')
    ax1.set_ylabel('sentiment count', color=color)
    ax1.tick_params(axis='y', labelcolor=color)

    ax1.plot(sub_df['call_date'], sub_df[sentiments], marker='o')
    ax1.set_title(ticker)
    plt.setp(ax1.get_xticklabels(), rotation=30, horizontalalignment='right')
    ax1.legend(sentiments, loc='upper left')
    ax1.xaxis.grid() # vertical lines
    color = 'tab:purple'
    ax2 = ax1.twinx()  # instantiate a second axes that shares the same x-axis
    ax2.set_ylabel('share price (close)', color=color)  # we already handled the x-label with ax1
    ax2.plot(price_sub_df.index, price_sub_df, color=color)
    ax2.tick_params(axis='y', labelcolor=color)
    fig.tight_layout()  # otherwise the right y-label is slightly clipped
    st.pyplot(fig)


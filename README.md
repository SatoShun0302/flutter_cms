# flutter_cms
## 概要
Flutter / Firebase Storage / Cloud Firestore を使用してCMSを構築する  

### 事前確認事項
- [X] Firebase StorageおよびCloud Firestoreの料金算出（ページアクセス時に発生するリクエスト数など確認）
- [ ] Flutter画面から、Cloud Firestore内にテキストのみのオブジェクトデータを新規作成する事ができるかを確認
- [ ] Flutter画面から、Cloud Firestore内のテキストのみのオブジェクトデータを更新する事ができるかを確認
- [ ] Flutter画面から、Firebase Storageに画像を新規アップロードし、パスを取得する事ができるかを確認
- [ ] Firebase Storageにアップロードした画像を、Flutter画面に表示する事ができるかを確認
- [ ] Flutter画面で、画像を含んだオブジェクトデータを作成。画像のみを先にFire Storageにアップし、画像のパスをオブジェクトに持たせFire Storeへ新規作成をすることが出来るかを確認
- [ ] 上記で作成したオブジェクトを取得し、Flutter画面に画像およびテキストを表示する事ができるかを確認
- [ ] 作成済みのオブジェクトを、Flutter画面からの操作で削除する事ができるかを確認
- [ ] オブジェクトを複数件作成し、それらを全件取得する事ができるかを確認
- [ ] 複数件作成したオブジェクトのうち、指定した件数のみを取得する事ができるかを確認
- [ ] カテゴリーを条件に検索し、正しい結果を取得する事ができるかを確認
- [ ] authorを条件に検索し、正しい結果を取得する事ができるかを確認
- [ ] Titleを条件に検索し、正しい結果を取得する事ができるかを確認
- [ ] データが更新されていない記事一覧を取得した際、クエリ発行分のアクセスのみしか発生しないことを確認
- [ ] データが更新された記事一覧を取得した際、クエリ発行分+更新された記事分のアクセスが発生することを確認
